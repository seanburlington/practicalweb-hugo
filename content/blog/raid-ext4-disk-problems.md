---
layout: post
title: RAID ext4 disk problems
date: 2011-09-20T14:20:45+01:00
comments: true
tags:
  - linux
  - note to self
  - raid
---

One of those posts for myself in case I need to come back to this later

I have a new PC which is very fast apart from problems with disc access seeming slow (and the disks being physically noisy)

The following related links led me to try a solution

<!--more-->

http://forums.gentoo.org/viewtopic-t-843292.html

http://marc.info/?l=linux-raid&m=128506852210452&w=2

/etc/fstab

`UUID=317f7912-9956-41f1-9855-7bee69c950b3 / ext4 errors=remount-ro,barrier=0 0 1`

NB adding barrier=0 here seems to have solved the problem
