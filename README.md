cross-compilers
===============

Dockerfiles for cross compiling environments

### Overview
All the compilers run as docker linux containers in a linux x86_64 system/host machine. This eliminates the need for a hypervisor and the installation of any packages (plus aditional configuration) on the host machine appart from docker itself.

#### Requirements
* Linux x86_64 host (or virtual machine). For windows and OSX you may want to consider boot2docker (http://boot2docker.io/). Boot2docker is a minimal linux virtual machine based on tinycore linux (http://distro.ibiblio.org/tinycorelinux/). This minimal virtual linux system runs completely from RAM, weights ~27MB and boots in ~5s

* Docker installed on the host machine

* Docker service/socket running on the host machine. For Ubuntu derivatives: sudo service docker start | For Linux Arch based systems: sudo systemctl docker start | Boot2docker enables the service after the machine is started

#### Building

Either build all images with:

    make all

Or selectively by building the base image first, then the platform of your choice:

    make base
    make android-arm

#### Useful docker commands

* To completely purge the cache and remove any built docker containers and images:

```bash
#!/bin/bash
# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)
```
