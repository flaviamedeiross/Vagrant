Vagrant.configure("2") do |config|
  # Pasta compartilhada padrão para todas as VMs
  config.vm.synced_folder "./data", "/opt/data"

  # Criando VM Frontend 
  config.vm.define "frontend" do |node|
    node.vm.box = "ubuntu/bionic64"
    node.vm.hostname = "frontend"
    node.vm.network "private_network", ip: "192.168.56.12"

    node.vm.provider "virtualbox" do |vb|
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
    node.vm.network "private_network", ip: "192.168.56.13"

    node.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "1024"
      vb.cpus = 2
    end
    # Configura o MySQL
    node.vm.provision "shell", path: "config_backend.sh"
  end

  # Criando VM Proxy 
  config.vm.define "proxy" do |proxy|
    proxy.vm.network "forwarded_port", guest: 80, host: "#{8080}"
    proxy.vm.box = "ubuntu/bionic64"
    proxy.vm.hostname = "proxy"
    proxy.vm.network "public_network"
    proxy.vm.network "private_network", virtualbox_intnet:"rede_mv", ip: "192.168.56.11"
    proxy.vm.provider "virtualbox" do |vb|
	    vb.gui = false
	    vb.memory = "1024"
	    vb.cpus = 2
	  end
    # Configura o Proxy (Nginx + Proxy Reverso)
    proxy.vm.provision "shell", path: "config_proxy.sh"
  end
end