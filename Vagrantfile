# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  #https://atlas.hashicorp.com/ubuntu/trusty64
  config.vm.box_url = "https://atlas.hashicorp.com/ubuntu/trusty64"
  config.vm.box = "ubuntu/trusty64"

  config.vm.define "develop", autostart: false do |develop|
    develop.vm.network :private_network, ip: "192.168.33.10"
  end

  config.vm.define "course", primary: true do |course|
    course.vm.network :private_network, ip: "192.168.33.11"
    config.vm.synced_folder "mynotebooks", "/home/vagrant/mynotebooks", create: true
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 8888, host: 8888

  config.vm.provider "virtualbox" do |v|
    v.memory = 8000
    v.cpus = 4
  end

  # If true, then any SSH connections made will enable agent forwarding.
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/site.yml"
    ansible.inventory_path = "provisioning/hosts"
    ansible.verbose = "v"
  end

end
