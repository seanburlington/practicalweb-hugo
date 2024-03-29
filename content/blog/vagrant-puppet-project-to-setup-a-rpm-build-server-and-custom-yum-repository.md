---
layout: post
title: Vagrant / Puppet project to setup a RPM build server and custom yum repository
date: 2012-11-24T18:19:39Z
comments: true
tags:
  - redhat
  - centos
  - vagrant
  - puppet
  - devops
  - yum
  - rpm
---

I've published a project on github [https://github.com/practicalweb/vagrant-rpmbuild](https://github.com/practicalweb/vagrant-rpmbuild)

The project contains a Vagrant config file, and Puppet manifests that together with an appropriate basebox will create a VM setup to build RPMS and host them on a Custom Yum repository

To run this

<!--more-->

1. Install vagrant [http://vagrantup.com/](http://vagrantup.com/) (on Ubuntu just `apt-get install vagrant`)

2. Install Virtualbox [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads) (again on Ubuntu `apt-get install virtualbox`)

3. Clone this reporitory `git clone git@github.com:practicalweb/vagrant-rpmbuild.git`

4. run `vagrant up` from the root of your cloned repository (NB the first time you do the a 600Mb base image will be downloaded)

5. run `vagrant ssh` to connect to the new VM

6. To build the demo rpm and publish it locally run `/vagrant/build-rpm.sh` the key password is 'secret'

7. To install the demo package on the VM run `sudo yum install demo`

There is a Vagrant port forwarding rule, and firewall setup to allow the yum repo to be accessed on the host machine as http://localhos:8088/repo

This project is intended as documentation of how to setup this build environment, and as a starting point for further customisation, I'm sure it isn't perfect, I hope it is useful.

It's all released under GPL with no promise that it is fot for any purpose - see LICENCE.txt

I've tried to group the code logically, there are 4 modules

baseThis contains some generic stuff, pulling in a couple of packages not in the minimal centos install but that I find essential.The idea is that I would use this base module on every server I setup.rpmbuildJust what is needed to actually build the RPMstomyumrepoJust what is needed to serve a custom yum repository, the packages could be built elsewhereusemyrepoConfig to setup a machine to consume yum packages.This could be added to the setup for any machine that needs to use the custom packagesI've included a minimal RPM project to get things rolling, it just installs a single text file.

I've built a GPG key to sign packages with, and also included a script ( generate-gpg-key.sh ) which shows how to generate a new one, edit this file to make your own key.

The base box I've defined is a minimal install of CentOS 6.3 (64 bit) with the dependencies required for vagrant.

Base boxes are quite a heavy download, but you only need to do it once and then you can have as many VMs as you want based on them, because the base is minimal and all extra config is done in puppet each of these VMs can serve a very differnt purpose - just by changing the Vagrantfile and puppet config.

The Vagrantfile runs puppet in standalone mode, but the modules _should_ work with a client/server Puppet setup - so hopefully migrating the Vagrant setup to any Puppet manged system should be easy.
