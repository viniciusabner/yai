import https from 'https';

const url = 'https://html.duckduckgo.com/html/?q=borracharia+Santo+Andre+SP+telefone';

https.get(url, {
  headers: {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'
  }
}, (res) => {
  let data = '';
  res.on('data', chunk => data += chunk);
  res.on('end', () => {
    // Extract text from HTML roughly
    const text = data.replace(/<[^>]*>?/gm, ' ');
    // Find phone numbers (11) XXXX-XXXX
    const phones = text.match(/\(?11\)?\s*9?\d{4}-?\d{4}/g);
    console.log("Found phones:", phones ? [...new Set(phones)] : []);
    
    // Find context around "Borracharia"
    const matches = text.match(/.{0,60}Borracharia.{0,60}/gi);
    if(matches) {
       matches.slice(0, 10).forEach(m => console.log(m.trim()));
    }
  });
}).on('error', err => console.error(err));
