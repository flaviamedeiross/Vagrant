Vagrant.configure("2") do |config|
  # Pasta compartilhada padrão para todas as VMs
  config.vm.synced_folder "./data", "/opt/data"

  # Caminho da chave privada
  frontend_key = ".vagrant/machines/frontend/virtualbox/private_key"
  backend_key = ".vagrant/machines/backend/virtualbox/private_key"
  proxy_key = ".vagrant/machines/proxy/virtualbox/private_key"

  # Criando VM Frontend 
  config.vm.define "frontend" do |node|
    node.vm.box = "ubuntu/bionic64"
    node.vm.hostname = "frontend"

    # Configura rede privada sem NAT
    node.vm.network "private_network", ip: "192.168.56.12", nic_type: "82540EM"


    if File.exist?(frontend_key)
      # Configura SSH para rede privada, se a chave já existir
      node.ssh.host = "192.168.56.12"
      node.ssh.port = 22 
      node.ssh.username = "vagrant"
      node.ssh.insert_key = false
      node.ssh.private_key_path = frontend_key
    else
      node.ssh.insert_key = true
    end

    # VirtualBox provider
    node.vm.provider "virtualbox" do |vb|
      vb.name = "frontend"
      vb.gui = false
      vb.memory = "1024"
      vb.cpus = 2
    end

    # Configura o Node.js
    node.vm.provision "shell", path: "config_frontend.sh"
  end

  # Criando VM Backend 
  config.vm.define "backend" do |node|
    node.vm.box = "ubuntu/bionic64"
    node.vm.hostname = "backend"

    # Configura rede privada sem NAT
    node.vm.network "private_network", ip: "192.168.56.13", nic_type: "82540EM"

    if File.exist?(backend_key)
      # Configura SSH para rede privada, se a chave já existir
      node.ssh.host = "192.168.56.13"
      node.ssh.port = 22 
      node.ssh.username = "vagrant"
      node.ssh.insert_key = false
      node.ssh.private_key_path = backend_key
    else
      node.ssh.insert_key = true
    end

    # VirtualBox provider
    node.vm.provider "virtualbox" do |vb|
      vb.name = "backend"
      vb.gui = false
      vb.memory = "1024"
      vb.cpus = 2
    end

    # Configura o MySQL
    node.vm.provision "shell", path: "config_backend.sh"
  end

  # Criando VM Proxy 
  config.vm.define "proxy" do |proxy|
    proxy.vm.box = "ubuntu/bionic64"
    proxy.vm.hostname = "proxy"

    # Mantém NAT e rede pública para o proxy
    proxy.vm.network "forwarded_port", guest: 80, host: 8080
    proxy.vm.network "public_network"
    proxy.vm.network "private_network", virtualbox_intnet:"rede_mv", ip: "192.168.56.11", nic_type: "82540EM"

    if File.exist?(proxy_key)
      # Configura SSH para rede privada, se a chave já existir
      proxy.ssh.host = "192.168.56.11"
      proxy.ssh.port = 22 
      proxy.ssh.username = "vagrant"
      proxy.ssh.insert_key = false
      proxy.ssh.private_key_path = proxy_key
    else
      proxy.ssh.insert_key = true
    end

    # VirtualBox provider
    proxy.vm.provider "virtualbox" do |vb|
      vb.name = "proxy"
      vb.gui = false
      vb.memory = "1024"
      vb.cpus = 2
    end

    # Configura o Proxy (Nginx + Proxy Reverso)
    proxy.vm.provision "shell", path: "config_proxy.sh"
  end
end
