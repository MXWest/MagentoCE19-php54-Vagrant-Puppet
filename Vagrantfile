#-*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  # For a complete config reference, see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "puphpet/debian75-x64"
  # config.vm.box_url = "If not from vagrant cloud, a sensible https link goes here"
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end

  config.vm.provision "shell",
    inline: "sudo apt-get update --yes"

  config.vm.provision "shell",
    inline: "puppet module install puppetlabs-stdlib"

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.synced_folder "data/", "/vagrant", id: "vagrant-root", owner: "www-data", group: "www-data"

  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "puppet/manifests"
     puppet.manifest_file  = "base.pp"
     puppet.module_path    = "puppet/modules"
  end

end
