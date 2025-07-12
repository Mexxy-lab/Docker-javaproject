VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/ubuntu-22.04"
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true

  # Master Node
  config.vm.define "master-node" do |node|
    node.vm.hostname = "master-node"
    node.vm.network "private_network", ip: "192.168.56.38"
    node.vm.synced_folder ".", "/vagrant", disabled: true

    node.vm.provider :virtualbox do |v|
      v.memory = 6144
      v.cpus = 2
    end

    node.vm.provision "shell", inline: <<-SHELL
      export DEBIAN_FRONTEND=noninteractive
      apt-get update -y
      apt-get upgrade -yq
      apt-get install -y python3 python3-pip python-is-python3
      sudo apt-get install ca-certificates curl
      sudo install -m 0755 -d /etc/apt/keyrings
      sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
      sudo chmod a+r /etc/apt/keyrings/docker.asc
      echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

      sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
      sudo usermod -aG docker vagrant
      sudo systemctl enable docker
      sudo docker --version
    SHELL
  end
end