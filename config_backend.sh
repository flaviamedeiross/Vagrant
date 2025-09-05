#!/bin/bash

# Corrige DNS temporariamente 
sudo rm -f /etc/resolv.conf
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf

# Instala MySQL server 
sudo apt update
sudo apt install -y mysql-server

# Configura MySQL para aceitar conexões apenas na rede privada
sudo sed -i "s/bind-address.*/bind-address = 192.168.56.13/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Ativa e inicia o serviço MySQL 
sudo systemctl enable mysql
sudo systemctl restart mysql

# Criar banco de dados se não existir 
sudo mysql -e "CREATE DATABASE IF NOT EXISTS meu_db;"

# Criar usuário do frontend e conceder permissões 
sudo mysql -e "CREATE USER IF NOT EXISTS 'usuario'@'192.168.56.12' IDENTIFIED BY 'senha';"
sudo mysql -e "GRANT ALL PRIVILEGES ON meu_db.* TO 'usuario'@'192.168.56.12';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Importar script SQL existente 
SQL_FILE="/opt/data/backend/init.sql"
if [ -f "$SQL_FILE" ]; then
    echo "Importando script SQL: $SQL_FILE"
    sudo mysql meu_db < "$SQL_FILE"
else
    echo "Nenhum script SQL encontrado em $SQL_FILE"
fi

echo "Configuração do MySQL concluída!"
