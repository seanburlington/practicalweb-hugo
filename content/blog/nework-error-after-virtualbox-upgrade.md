---
layout: post
title: Nework Error after VirtualBox Upgrade
date: 2009-04-27T11:35:45+01:00
comments: true
tags:
  - testing
  - virtualbox
---

I decided to upgrade  VirtualBox because the newer versions have much better support for networks that allow virtual computer to be visible on the real network.

But after upgrade I encountered the error

> HostInterface': The attribute 'name' is required but missing.

It seems others have had similar issues

http://forums.virtualbox.org/viewtopic.php?p=58720&amp;sid=f3759d4d938c30120502ad5610833caa

I resolved this by deleting this entry:

`<HostInterface/>`

from the config file, in my case this was

`.VirtualBox/Machines/WinXP/WinXP.xml`

After this the virtual machine worked fine - and the new network settings are great.
