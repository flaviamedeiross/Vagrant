#!/bin/bash

# Instalando o Node para o Frontend
sudo apt update
sudo apt install -y nodejs npm

# Pasta compartilhada do Frontend
cd /opt/data/frontend

# Instala as dependeicias e inicializa o servidor Node no background
npm install
nohup node server.js &
