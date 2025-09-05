const express = require('express');
const mysql = require('mysql2/promise');

const app = express();
app.use(express.json());

// Conexão com MySQL
const dbConfig = {
    host: '192.168.56.13',   // IP do backend
    user: 'admin',
    password: '1234',
    database: 'receitas_db'
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

const path = require('path');
// Servir arquivos estáticos da pasta "public"
app.use(express.static(path.join(__dirname, 'public')))

// Rotas do frontend
//app.get('/', (req, res) => {
//    res.send('Frontend rodando e acessando o MySQL!');
//});

// Rota API que retorna todos os usuários
app.get('/api/receitas', async (req, res) => {
    try {
        const [rows] = await connection.execute('SELECT * FROM receitas');
        res.json(rows);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// app.get('/api/users', async (req, res) => {
//   db.query('SELECT * FROM users', (err, results) => {
//     if (err) {
//       return res.status(500).json({ error: err.message });
//     }
//     res.json(results);
//   });
// });

// // Rota para adicionar usuário
// app.post('/api/users', async (req, res) => {
//     try {
//         const { name, email } = req.body;
//         const [result] = await connection.execute(
//             'INSERT INTO users (name, email) VALUES (?, ?)',
//             [name, email]
//         );
//         res.json({ id: result.insertId, name, email });
//     } catch (err) {
//         res.status(500).json({ error: err.message });
//     }
// });

// app.listen(80, () => console.log('Frontend rodando na porta 80'));

const PRIVATE_IP = '192.168.56.12'; // IP da VM frontend na rede privada
app.listen(80, PRIVATE_IP, () => {
    console.log(`Frontend rodando na porta 80 na rede privada ${PRIVATE_IP}`);
});
