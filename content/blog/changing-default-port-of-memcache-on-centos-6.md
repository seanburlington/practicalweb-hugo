---
layout: post
title: Changing default port of memcache on Centos 6
date: 2012-11-12T12:51:44Z
comments: true
tags:
  - sysadmin
  - centos
  - rhel
  - selinux
---

One of those things that just took me a lot longer than I expected...

Changing memcache port seems simple enough - just edit
`/etc/sysconfig/memcached` and change the PORT value

BUT on a new centOS install memcache failed to start on any non-standard port.

To see any error message I had to edit the file `/etc/init.d/memcached`

and change the start line to

```bash
daemon --pidfile ${pidfile} memcached -d -v -p $PORT -u $USER \
-m $CACHESIZE -c $MAXCONN -P ${pidfile} $OPTIONS
```

Just adding the -v makes output verbose and I could see an error like

`memcache failed to listen on TCP port 11311 : Permission denied`

At this point I realised selinux was enabled by default, I tend to forget about this as it is so common for it to be disabled.

In order to add a new allowed port I added the following packages to edit selinux rules

```
policycoreutils-python
setroubleshoot-server
```

To check the name of the memcache port

```bash
semanage port -l | grep memcache
```

Then to allow the new port

```bash
sudo semanage port -a -t memcache_port_t -p tcp 11311
```

And now memcache works on the port I need for this project.

Sadly I don't see any good puppet modules to help with this, and it still seems selinux is very commonly disabled as it is tricky to work with.
