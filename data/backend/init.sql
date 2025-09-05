USE meu_db;

-- Criar tabela de usuários
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inserir usuários de exemplo
INSERT IGNORE INTO users (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com');


CREATE TABLE IF NOT EXISTS receitas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  descricao TEXT NOT NULL,
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT IGNORE INTO receitas (titulo, descricao) VALUES
('Bolo de Chocolate', 'Delicioso bolo de chocolate fofinho.'),
('Pizza Margherita', 'Pizza tradicional com tomate, mussarela e manjericão.'),
('Lasanha à Bolonhesa', 'Massa em camadas com molho bolonhesa e queijo gratinado.');
