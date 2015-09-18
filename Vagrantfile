# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Automate installation of a Ubuntu VM, with docker+tools
# USAGE: see vagrant.md
########

# The "2" in Vagrant.configure configures the configuration version 
Vagrant.configure(2) do |config|

  # See also https://docs.vagrantup.com.
  config.vm.box = "ubuntu/trusty64"
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. 
  config.vm.box_check_update = false

  # Proxies: if you network requires outgoing access via a proxy
  # vagrant plugin install vagrant-proxyconf
  # http://tmatilai.github.io/vagrant-proxyconf/
  # updates /etc/profile.d/proxy.sh /etc/environment 
  # can override: VAGRANT_HTTP_PROXY="http://proxy.example.com:8080" vagrant up
  #if Vagrant.has_plugin?("vagrant-proxyconf")
  #  config.proxy.http     = "http://proxy.example.ch:80/"
  #  config.proxy.https    = "http://proxy.example.ch:80/"
  #  #config.proxy.ftp      = "http://proxy.example.ch:80/"
  #  config.proxy.no_proxy = "localhost,127.0.0.1"
  #end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. 
  # E.g. for port 8001 inside the VM to 8001 on the mac host
  #config.vm.network "forwarded_port", guest: 8001, host: 8001

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration for VirtualBox
  # https://docs.vagrantup.com/v2/virtualbox/configuration.html
  config.vm.provider "virtualbox" do |vb|
    vb.name = "docker-test"
    # Display the VirtualBox GUI when booting the machine
    #vb.gui = true
    #vb.memory = "1024"
    #vb.cpus = 2
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available.
  config.vm.provision "shell", path: "vagrant.sh"

end

