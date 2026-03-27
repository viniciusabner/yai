import https from 'https';

const options = {
  hostname: 'nominatim.openstreetmap.org',
  path: '/search?q=borracharia+in+Santo+Andr%C3%A9,+SP&format=json&addressdetails=1&extratags=1&limit=50',
  headers: {
    'User-Agent': 'ContateJaDataCollector/1.0'
  }
};

https.get(options, (res) => {
  let data = '';
  res.on('data', chunk => data += chunk);
  res.on('end', () => {
    try {
      const places = JSON.parse(data);
      console.log(`Found ${places.length} places.`);
      places.forEach(p => {
        console.log(`- ${p.name || p.display_name.split(',')[0]} | ${p.extratags?.phone || 'No Phone'}`);
      });
    } catch (e) {
      console.error(e);
    }
  });
}).on('error', err => console.error(err));
