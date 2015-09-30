#!/usr/bin/env bash
curl -sSL https://get.docker.com/gpg | sudo apt-key add -
curl -sSL https://get.docker.com/ | sh
usermod -aG docker vagrant
usermod -aG docker www-data
