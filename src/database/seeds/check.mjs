import { createClient } from '@supabase/supabase-js';
const supabaseUrl = 'https://rbgjzxncnsqqhhktvthw.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJiZ2p6eG5jbnNxcWhoa3R2dGh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYwODQwNDYsImV4cCI6MjA4MTY2MDA0Nn0.Tz-tICFaR3owg81AR8SkUEMMwoZP1kFgTCUGiPDU9L8';

if (!supabaseUrl || !supabaseKey) {
  console.error("Missing Supabase credentials in env files.");
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function check() {
  console.log("Fetching providers...");
  const { data, error } = await supabase
    .from('providers')
    .select('id, name, category, city_slug')
    .eq('category', 'auto-eletrica');
    
  if (error) {
    console.error("Error fetching auto-eletrica:", error);
  } else {
    console.log(`Found ${data.length} providers with category 'auto-eletrica'.`);
    if (data.length > 0) {
      console.log(data.slice(0, 3));
    }
  }

  const { data: allCategories, error: catError } = await supabase
    .from('providers')
    .select('category');

  if (catError) {
    console.error("Error fetching categories:", catError);
  } else {
    const counts = {};
    for (const p of allCategories) {
      counts[p.category] = (counts[p.category] || 0) + 1;
    }
    console.log("Category counts in DB:", counts);
  }
}

check();
