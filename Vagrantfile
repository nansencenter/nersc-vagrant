# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box_url = "ftp://ftp.nersc.no/pub/python_test_data/nersc_base.box"
  config.vm.box = "nersc_base"

  config.vm.define "develop", autostart: false do |develop|
    develop.vm.network :private_network, ip: "192.168.33.10"
    develop.vm.network :forwarded_port, guest: 80, host: 9090
    develop.vm.synced_folder "python", "/home/vagrant/python", create: true
  end

  config.vm.define "course", primary: true do |course|
    course.vm.network :private_network, ip: "192.168.33.11"
    course.vm.synced_folder "mynotebooks", "/home/vagrant/mynotebooks", create: true
    course.vm.network :forwarded_port, guest: 80, host: 8080
    course.vm.network :forwarded_port, guest: 8888, host: 8888
  end

  config.vm.define "base", primary: true do |base|
    base.vm.network :private_network, ip: "192.168.33.12"
    base.vm.box = "ubuntu/trusty64"
    base.vm.box_url = "https://atlas.hashicorp.com/ubuntu/trusty64"
    base.vm.network :forwarded_port, guest: 80, host: 8090

    base.vm.provider "virtualbox" do |v|
      v.memory = 2000
      v.cpus = 2
    end

  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 4000
    v.cpus = 2
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
