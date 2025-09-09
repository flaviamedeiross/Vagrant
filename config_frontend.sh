#!/bin/bash

# Corrige DNS (se necessário)
sudo rm -f /etc/resolv.conf
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf

# Executa tudo como usuário vagrant
sudo -i -u vagrant bash <<'EOF'
  export NVM_DIR="$HOME/.nvm"

  # Instala o NVM se não existir
  if [ ! -d "$NVM_DIR" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
  fi

  # Garante que o NVM será carregado no login futuro
  if ! grep -q 'NVM_DIR' "$HOME/.bashrc"; then
    echo 'export NVM_DIR="$HOME/.nvm"' >> "$HOME/.bashrc"
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> "$HOME/.bashrc"
  fi

  # Carrega o NVM no shell atual
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  # Instala Node.js v16 (se não existir)
  if ! command -v node >/dev/null 2>&1; then
    nvm install 16
    nvm alias default 16
    nvm use 16
  fi

  cd /opt/data/frontend || exit 1

  # Instala dependências do projeto
  npm install
  npm install express mysql2

  # Garante que a pasta existe para o log
  mkdir -p "$HOME"

  # Inicia a aplicação em background
  nohup node server.js > "$HOME/node.log" 2>&1 &
EOF
