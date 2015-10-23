VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.provision "docker"
  config.vm.provider :virtualbox do |vb|
    vb.cpus = 4
    vb.memory = 4096
  end
  config.vm.network "private_network", ip: "192.168.50.4"
end