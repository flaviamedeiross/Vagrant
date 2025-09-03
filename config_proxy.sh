#!/bin/bash

# Instala o Nginx e remove as configuracoes default
sudo apt update
sudo apt install -y nginx
sudo rm /etc/nginx/sites-enabled/default

# Criando arquivo de configuracao para o Proxy Reverso
sudo tee /etc/nginx/sites-available/reverse-proxy <<'EOF'
server {
    listen 80;

    # Frontend
    location / {
        proxy_pass http://192.168.56.12:80;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    # Backend
    location /api/ {
        proxy_pass http://192.168.56.13:80/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
EOF

# Ativa a configuração e reinicia o Nginx
sudo ln -s /etc/nginx/sites-available/reverse-proxy /etc/nginx/sites-enabled/reverse-proxy
sudo systemctl restart nginx
