#!/usr/bin/env bash
export {http,https,ftp}_proxy="http://<proxy>:80"
no_proxy="localhost,.vptt.ch,.swissptt.ch,.corproot.net"
curl -sSL https://get.docker.com/gpg | sudo apt-key add -
curl -sSL https://get.docker.com/ | sh
usermod -aG docker vagrant
usermod -aG docker www-data
