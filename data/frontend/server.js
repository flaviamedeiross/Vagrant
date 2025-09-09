const express = require('express');
const mysql = require('mysql2/promise');

const app = express();
app.use(express.json());

const path = require('path');
// Servir arquivos estáticos da pasta "public"
app.use(express.static(path.join(__dirname, 'public')))

// Conexão com MySQL
const dbConfig = {
    host: '192.168.56.13',   // IP do backend
    user: 'usuario',
    password: 'senha',
    database: 'meu_db'
};

let connection;
(async () => {
    try {
        connection = await mysql.createConnection(dbConfig);
        console.log('Conectado ao MySQL com sucesso!');
    } catch (err) {
        console.error('Erro ao conectar ao MySQL:', err.message);
    }
})();

// Rota API que retorna todos os usuários
app.get('/api/receitas', async (req, res) => {
    try {
        const [rows] = await connection.execute('SELECT * FROM receitas');
        res.json(rows);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

const PRIVATE_IP = '192.168.56.12'; // IP da VM frontend na rede privada
app.listen(80, PRIVATE_IP, () => {
    console.log(`Frontend rodando na porta 80 na rede privada ${PRIVATE_IP}`);
});