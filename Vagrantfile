# -*- mode: ruby -*-
# # vi: set ft=ruby :

# Specify minimum Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

# Require YAML module
require 'yaml'

# Read YAML file with box details
servers = YAML.load_file('servers.yaml')

# Create boxes
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box_check_update = true
  # Iterate through entries in YAML file
  servers.each do |servers|
    config.vm.define servers["name"] do |srv|
      srv.vm.box = servers["box"]
      srv.vm.provision :shell, path: "bootstrap.sh"
      srv.vm.network "private_network", ip: servers["ip"]
      if servers["proxy"] == 'on'
         if Vagrant.has_plugin?("vagrant-proxyconf")
            config.proxy.http = "http://proxy.vptt.ch:80"
            config.proxy.https = "http://proxy.vptt.ch:80"
            config.proxy.no_proxy = "localhost,.vptt.ch,.swissptt.ch,.corproot.net"
         end
      end
      srv.vm.provider :virtualbox do |vb|
        vb.name = servers["name"]
        vb.memory = servers["ram"]
      end
    end
  end
end
