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
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 8888, host: 8888
  #ipython notebook --ip=0.0.0.0 --no-browser
  #http://127.0.0.1:8888/tree

  #config.vm.provider "virtualbox" do |v|
  #  v.memory = 8000
  #  v.cpus = 4
  #end

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true
  #config.ssh.private_key_path='/home/antonk/.ssh/id_rsa.pub'

  config.vm.synced_folder "mynotebooks", "/home/vagrant/mynotebooks", create: true
  #these will be downloaded in the course tasks

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/provision.yml"
    ansible.inventory_path = "provisioning/hosts"
    ansible.verbose = "v"
  end

end
