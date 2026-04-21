import dotenv from 'dotenv';
import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
dotenv.config();

const supabaseUrl = process.env.VITE_SUPABASE_URL;
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error("Missing Supabase credentials in env files.");
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function check() {
  console.log("Upserting all corrected Auto Eletrica records...");
  const files = fs.readdirSync('.').filter(f => f.includes('autoeletrica') && f.endsWith('.json'));
  let totalUpserted = 0;

  for (const f of files) {
    const data = JSON.parse(fs.readFileSync(f, 'utf8'));
    // Ensure category is correct before pushing
    const correctedData = data.map(item => ({ ...item, category: 'auto-eletrica' }));
    
    const { error: upsertError } = await supabase
      .from('providers')
      .upsert(correctedData, { onConflict: 'id' });
      
    if (upsertError) {
      console.error("Error upserting", f, upsertError);
    } else {
      console.log(`Upserted ${correctedData.length} records from ${f}`);
      totalUpserted += correctedData.length;
    }
  }
  console.log("Total upserted:", totalUpserted);
}

check();
