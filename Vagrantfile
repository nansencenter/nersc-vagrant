# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box_url = "ftp://ftp.nersc.no/pub/python_test_data/nersc_base.box"
  config.vm.box = "nersc_base"

  config.vm.define "develop", autostart: false do |develop|
    develop.vm.network :private_network, ip: "192.168.33.10"
    develop.vm.synced_folder "python", "/home/vagrant/python", create: true
    # run django server: ./manage.py runserver 192.168.33.10:9090 let's you
    # access that address in the browser...
  end

  config.vm.define "course", primary: true do |course|
    course.vm.box = "ubuntu/trusty64"
    course.vm.box_url = "https://atlas.hashicorp.com/ubuntu/trusty64"
    course.vm.network :private_network, ip: "192.168.33.11"
  end

  config.vm.define "testintegration", autostart: false do |testintegration|
    testintegration.vm.network :private_network, ip: "192.168.33.12"
    testintegration.vm.box = "ubuntu/trusty64"
    testintegration.vm.box_url = "https://atlas.hashicorp.com/ubuntu/trusty64"

    # configure the line below if you have local folder with test data
    testintegration.vm.synced_folder "/Data/FTPRoot/pub/nansat/test_data", "/vagrant/shared/test_data", create: true

    testintegration.vm.provider "virtualbox" do |v|
      v.memory = 6000
      v.cpus = 4
    end

  end

  config.vm.define "production", autostart: false do |production|
    production.vm.network :private_network, ip: "192.168.33.14"
    # Is a synced folder needed here? Production should rely on safe, and well tested branches, right?
    #production.vm.synced_folder "python", "/home/vagrant/python", create: true
    production.vm.network :forwarded_port, guest: 90, host: 9090
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
