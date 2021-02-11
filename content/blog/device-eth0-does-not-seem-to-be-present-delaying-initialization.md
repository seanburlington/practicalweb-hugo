---
layout: post
title: Device eth0 does not seem to be present, delaying initialization.
date: 2012-05-02T12:26:38+01:00
comments: true
tags:
  - linux
  - virtualbox
  - redhat
  - centos
  - networking
---

I had a centos VM that I hadn't used in a while, I think I cloned it from another version.

When I came to use it again I had no network andtrying to start the network I got the error message in the title.

There seem to be a few issues

Firstly networking isn't enabled by default

http://wiki.centos.org/FAQ/CentOS6#head-b67e85d98f0e9f1b599358105c551632c6ff7c90

Secondly the cloned image appears to get a different mac address for the network card, but the config doesn't auto detect this

Thirdly the new machine seemed to have eth1 instead of eth0

and finally I needed to enable dhcp

What this meant was copying the new mac address from the virtualbox network settings tab (inserting a colon every second charecter  to match the format required)

I placed this in both

`/etc/udev/rules.d/70-persistant-net.rules`

and

`/etc/sysconfig/network-scripts/ifcfg-eth0`

Where I also set

```
ONBOOT="yes" 
BOOTPROTO="dhcp"
```

Finally `/etc/init.d/networking restart` got my network up
