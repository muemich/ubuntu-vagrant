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
    #config.vm.define no-proxy["name"] do |srv|
    config.vm.define servers["name"] do |srv|
      srv.vm.box = servers["box"]
      if servers["proxy"] == 0
        srv.vm.provision :shell, path: "bootstrap.sh"
      else servers["proxy"] == 1
        if Vagrant.has_plugin?("vagrant-proxyconf")
          config.proxy.http = "http://<proxy>:80"
          config.proxy.https = "http://<proxy>:80"
          config.proxy.no_proxy = "localhost,127.0.0.1,.example.com"
        end
        srv.vm.provision :shell, path: "bootstrap-proxy.sh"
      end
      srv.vm.network "private_network", ip: servers["ip"]
      srv.vm.provider :virtualbox do |vb|
        vb.name = servers["name"]
        vb.memory = servers["ram"]
      end
    end
  end
end
