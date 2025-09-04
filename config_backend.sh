#!/bin/bash

# Instala o MySQL server
sudo rm -f /etc/resolv.conf
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf
sudo apt update
sudo apt install -y mysql-server

# Ativa e inicializa o servico MySQL
sudo systemctl enable mysql
sudo systemctl start mysql

# Importar o dump SQL inicial, se ele existir
if [ -f /opt/data/backend/init.sql ]; then
    mysql -u root < /opt/data/backend/init.sql
fi
