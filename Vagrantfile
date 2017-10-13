# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
# ex how to run cos_condarecipes with just the tag to update recipes: 
# export ANSIBLE_ARGS='--tags=update_recipes'; vagrant provision cos_condarecipes
ANSIBLE_ARGS=ENV['ANSIBLE_ARGS']

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://atlas.hashicorp.com/ubuntu/trusty64"

  config.vm.define "develop", autostart: false do |develop|
    develop.vm.network :private_network, ip: "192.168.33.10"
    # run django server: ./manage.py runserver 192.168.33.10:9090 let's you
  end

  config.vm.define "course", primary: true do |course|
    course.vm.network :private_network, ip: "192.168.33.11"
  end

  config.vm.define "condarecipes", autostart: false do |condarecipes|
    condarecipes.vm.network :private_network, ip: "192.168.33.13"
  end

  config.vm.define "thredds", autostart: false do |thredds|
    thredds.vm.network :private_network, ip: "192.168.33.15"
    thredds.vm.provider "virtualbox" do |v|
      v.memory = 6000
      v.cpus = 4
    end
  end

  config.vm.define "pyoai", autostart: false do |pyoai|
    pyoai.vm.box_url = "https://atlas.hashicorp.com/geerlingguy/boxes/centos7"
    pyoai.vm.box = "geerlingguy/centos7"
    pyoai.vm.network :private_network, ip: "192.168.33.18"
    pyoai.vm.provider "virtualbox" do |v|
      v.memory = 2000
      v.cpus = 1
    end

  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 4000
    v.cpus = 2
  end

  # If true, then any SSH connections made will enable agent forwarding.
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "provisioning/site.yml"
    ansible.inventory_path = "provisioning/hosts"
    ansible.provisioning_path = "/vagrant"
    ansible.verbose = "vvv"
    ansible.install = true
    ansible.install_mode = "pip"
    ansible.raw_arguments = ANSIBLE_ARGS
  end

end
