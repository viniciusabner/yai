import https from 'https';

const query = `
[out:json][timeout:25];
area["name"="Santo André"]["admin_level"="8"]->.searchArea;
(
  node["shop"="tyres"](area.searchArea);
  way["shop"="tyres"](area.searchArea);
  node["craft"="tinsmith"](area.searchArea);
);
out body;
>;
out skel qt;
`;

const options = {
  hostname: 'overpass-api.de',
  path: '/api/interpreter',
  method: 'POST',
  headers: {
    'Content-Type': 'application/x-www-form-urlencoded',
    'User-Agent': 'ContateJaDataCollector/1.0'
  }
};

const req = https.request(options, (res) => {
  let data = '';
  res.on('data', chunk => data += chunk);
  res.on('end', () => {
    try {
      const result = JSON.parse(data);
      console.log(`Found ${result.elements.length} elements.`);
      const places = result.elements.filter(e => e.tags && e.tags.name);
      console.log(`Places with names: ${places.length}`);
      places.forEach(p => {
        console.log(`- ${p.tags.name} | ${p.tags.phone || p.tags['contact:phone'] || 'No Phone'} | ${p.tags['addr:street'] || p.tags['addr:suburb'] || 'No address'}`);
      });
    } catch (e) {
      console.error('Error parsing JSON:', e.message);
    }
  });
});

req.on('error', err => console.error(err));
req.write('data=' + encodeURIComponent(query));
req.end();
