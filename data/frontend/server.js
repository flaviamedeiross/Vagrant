const express = require('express');
const mysql = require('mysql2');
const path = require('path');

const app = express();
const PORT = 80;

// --- Conexão MySQL ---
const db = mysql.createConnection({
  host: '192.168.56.13',
  user: 'root',
  password: '',
  database: 'testdb'
});

db.connect(err => {
  if (err) {
    console.error('Erro ao conectar ao MySQL:', err);
    process.exit(1);
  }
  console.log('Conectado ao MySQL!');
});

// --- Rotas ---
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));  // envia um arquivo HTML simples
});

app.get('/api', (req, res) => {
  db.query('SELECT * FROM exemplo', (err, results) => {
    if (err) return res.status(500).json({ error: 'Erro ao consultar o banco' });
    res.json(results);
  });
});

// --- Inicia o servidor ---
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Servidor Node rodando na porta ${PORT}`);
});
