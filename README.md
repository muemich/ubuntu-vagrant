
#### A quick way to setup a docker test environment. This tool
 * Create x VMs with the Ubuntu 14.04 (hashcorp/trusty box)
 * Pulls the latest docker release

#### USAGE
-----
``` bash
vagrant up
vagrant ssh

```

---

#### Change VM settings

Change setting for like names, IPs, RAM, if you're unlucky and sitting behind a proxy you need to change this in servers.yaml


#### TODO
----
Use a more lightweight base image than Ubuntu 14.04 if you're just want to have a docker host
