const http = require('http');
http.get({hostname:'localhost', port:3000, path:'/health'}, res => {
  if(res.statusCode === 200){ console.log('Integration test passed!'); process.exit(0); }
  else { console.error('Integration test failed'); process.exit(1); }
}).on('error', () => process.exit(1));
