import fs from 'fs';
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = 'https://rbgjzxncnsqqhhktvthw.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJiZ2p6eG5jbnNxcWhoa3R2dGh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYwODQwNDYsImV4cCI6MjA4MTY2MDA0Nn0.Tz-tICFaR3owg81AR8SkUEMMwoZP1kFgTCUGiPDU9L8';

const supabase = createClient(supabaseUrl, supabaseKey);

async function run() {
  const { data, error } = await supabase
    .from('cities')
    .select('id, slug');
    
  if (error) console.error(error);
  else {
    const map = {};
    data.forEach(d => { map[d.slug] = d.id; });
    fs.writeFileSync('city_ids.json', JSON.stringify(map, null, 2));
    console.log('Exported JSON successfully');
  }
}
run();
