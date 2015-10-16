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
      if ENV["http_proxy"]
        # Detect proxies and configure
        if Vagrant.has_plugin?("vagrant-proxyconf")
          config.proxy.http     = ENV.fetch('http_proxy')
          if ENV["https_proxy"]
            config.proxy.https    = ENV.fetch('https_proxy')
          end
          if ENV["no_proxy"]
             config.proxy.no_proxy = ENV.fetch('no_proxy')
          end
        end
      end
      srv.vm.network "private_network", ip: servers["ip"]
      srv.vm.provision :shell, path: "bootstrap.sh"
      srv.vm.provider :virtualbox do |vb|
        vb.name = servers["name"]
        vb.memory = servers["ram"]
      end
    end
  end
end
