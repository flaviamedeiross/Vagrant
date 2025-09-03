// server.js
const http = require('http');

const PORT = 80;  
const server = http.createServer((req, res) => {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Frontend rodando!\n');
});

server.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
