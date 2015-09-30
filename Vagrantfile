# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Automate installation of a Ubuntu VM, with docker+tools
# USAGE: see vagrant.md
########

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = false
  config.vm.provision "shell", path: "vagrant.sh"
  (1..2).each do |i|
    config.vm.define "docker-test#{i}" do |node|
      config.vm.provider "virtualbox" do |node|
        node.name = "docker-test#{i}"
        config.vm.network "private_network", ip:"172.17.9.20#{i}"
      end
    end
  end
end
