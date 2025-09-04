#!/bin/bash

# Instalando o Node para o Frontend
sudo rm -f /etc/resolv.conf
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf
sudo apt update
sudo apt install -y nodejs npm

# Pasta compartilhada do Frontend
cd /opt/data/frontend

# Instala as dependeicias e inicializa o servidor Node no background
npm install
nohup node server.js &
