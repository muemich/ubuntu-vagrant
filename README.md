
A quick way to setup a docker test environment. This tool
 * Creates a VM with the Ubuntu 14.04 (hashcorp/trusty box)
 * Pulls the latest docker release, fixes a few permissions and installs docker-compose.
 * Pulls a small example container (alpine linux)

Features
 * Tested on: Mac 10.10 +Virtualbox 4.3.30 +Vagrant 1.7.4, Windows 8 +Virtual 4.3.8 + Vagrant 1.7.2
 * Works with outgoing proxies (adapt the lines in Vagrantfile)

Why
 * This pattern is small, simple and easy to duplicate into other projects.
 * Reason: docker-machine was a bit too complex and didn't work for me. Boot2docker is no longer supported.

USAGE
-----
```
vagrant up
vagrant ssh

# play with docker:
docker images
docker run --rm -it alpine sh

# /vagrant gives accces to the host folder
ls /vagrant
```
---

## Change VM settings

Change setting for like name, IP, RAM, proxy inside servers.yaml

TODO
----
Use a more lightweight base image than Ubuntu 14.04
