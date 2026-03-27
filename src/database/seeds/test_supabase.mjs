import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
const supabaseUrl = 'https://rbgjzxncnsqqhhktvthw.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJiZ2p6eG5jbnNxcWhoa3R2dGh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYwODQwNDYsImV4cCI6MjA4MTY2MDA0Nn0.Tz-tICFaR3owg81AR8SkUEMMwoZP1kFgTCUGiPDU9L8';

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
