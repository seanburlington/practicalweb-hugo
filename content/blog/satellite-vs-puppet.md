---
layout: post
title: Satellite vs Puppet
date: 2012-11-20T23:09:51Z
comments: true
tags:
  - puppet
  - satellite
  - spacewalk
  - configuration management
  - devops
---

I've been using Puppet for a little while and am now working on a project that will be using RedHat's Satellite (the upstream project is Spacewalk).

I haven't really used puppet in anger on production systems yet, I'm referring to the open source edition of Puppet, and have only read about Satellite, but I didn't find much comparison out there so thought it worth writing up what I've found.

They key differences that strike me are

- Satellite is RedHat/Centos only, Puppet works on multiple distributions, and even on Windows to some extent
- Satellite is primarily a GUI driven system whereas Puppet is primarily text configuration (puppet has a web dashboard but it's really just a log viewer)
- Satellite can manage provisioning of new systems (I'm using openstack for provisioning new VMs anyway, Razor is said to work well with Puppet for provisioning)
- Satellite manages configuration via simple templates with limited variable use, Puppets templates are fully scriptable
- Puppet has a very rich dependency system (eg you can trigger an Apache restart whenever a configuration change occurs
- Satellite uses a mixture of technologies (python, Java, C) puppet is written in Ruby.
- Puppet is available as a package on Ubuntu/debian systems, on Redhat/centos it has to be installed via the EPEL repo, pulling in extra dependencies
  Personally I much prefer puppet's approach, it's easy to keep all the config in git and test changes in a dev env before rolling out.

I love puppet's declarative approach, and the ability to chain dependencies

That said I'm really looking forward to playing with Satellite, finding out how provisioning works when all the servers are VMs and seeing how we manage the dependency tracking
