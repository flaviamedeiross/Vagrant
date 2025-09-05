#!/bin/bash

# Corrige DNS temporariamente 
sudo rm -f /etc/resolv.conf
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf

# Instala o Nginx e remove as configs default
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

    # Rotas de API -> direcionar para o frontend (que fará a chamada ao backend)
    location /api/ {
        proxy_pass http://192.168.56.12:80/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
EOF

# Ativa a configuração e reinicia o Nginx
sudo ln -s /etc/nginx/sites-available/reverse-proxy /etc/nginx/sites-enabled/reverse-proxy
sudo systemctl restart nginx
