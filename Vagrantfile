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
      set -e
      export DEBIAN_FRONTEND=noninteractive

      apt-get update -y
      apt-get upgrade -yq
      apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release software-properties-common
      install -m 0755 -d /etc/apt/keyrings
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
      chmod a+r /etc/apt/keyrings/docker.gpg
      echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        tee /etc/apt/sources.list.d/docker.list > /dev/null
      apt-get update -y
      apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
      groupadd docker || true
      usermod -aG docker vagrant
      systemctl enable docker
      systemctl start docker
      docker --version
    SHELL
  end
end