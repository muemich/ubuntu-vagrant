
A quick way to setup a docker test environment.
 * Pulls the latest docker release, fixes a few permissions and installs docker-compose. Works with proxies.
 * Created on a Mac 10.10 with Virtualbox. Not tested on Windows yet.
 * Reason: docker-machine was a bit too complex and didn't work for me. Boot2docker is no longer supported.
 * This pattern is small, simple and easy to duplicate into other projects.

USAGE
-----
```
  vagrant up
  vagrant ssh

  # play with docker:
  docker images
  docker run --rm -it alpine sh
```

Inside the VM /vagrant gives accces to the host folder.


TODO
----
Use a more lightweight image than Ubuntu 14.04

