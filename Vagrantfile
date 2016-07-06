# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

module OS
    def OS.windows?
        (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    end

    def OS.mac?
        (/darwin/ =~ RUBY_PLATFORM) != nil
    end

    def OS.unix?
        !OS.windows?
    end

    def OS.linux?
        OS.unix? and not OS.mac?
    end
end

if OS.windows?
  system("IF '#{ARGV[0]}' EQU 'up' ( setup.bat ) & IF '#{ARGV[0]}' EQU 'provision' ( setup.bat )")
end

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

  config.vm.define "testintegration", autostart: false do |testintegration|
    testintegration.vm.network :private_network, ip: "192.168.33.12"

    # configure the line below if you have local folder with test data
    #testintegration.vm.synced_folder "/Data/FTPRoot/pub/nansat/test_data", "/vagrant/shared/test_data", create: true

    testintegration.vm.provider "virtualbox" do |v|
      v.memory = 6000
      v.cpus = 4
    end

  end

  config.vm.define "condarecipes", autostart: false do |condarecipes|
    condarecipes.vm.network :private_network, ip: "192.168.33.13"
  end

  config.vm.define "condarecipes32", autostart: false do |condarecipes32|
    condarecipes32.vm.box = "ubuntu/trusty32"
    condarecipes32.vm.box_url = "https://atlas.hashicorp.com/ubuntu/trusty32"
    condarecipes32.vm.network :private_network, ip: "192.168.33.16"
  end

  config.vm.define "thredds", autostart: false do |thredds|
    thredds.vm.network :private_network, ip: "192.168.33.15"

    thredds.vm.provider "virtualbox" do |v|
      v.memory = 6000
      v.cpus = 4
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
    ansible.verbose = "v"
  end

end
