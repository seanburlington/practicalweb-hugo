---
layout: post
title: ! "RAID - protecting my data "
date: 2007-11-12T16:15:44Z
comments: true
tags:
  - linux
  - raid
---

I’ve
had too many hard disk failures over the years and decided to use RAID
to ensure that all my photos, email and work are always copied to two
disks so that if any one of them fails I don’t lose anything.

<!--more-->

Recently I was upgrading my system and accidentally unplugged one of
these disks - I didn’t even notice until I got an automatic email
warning me that one of the disks wasn’t working!

Plugging it back in and getting it working was pretty easy!

note to future self - the commands were

show what is happening `mdadm --query --detail /dev/md1`

add drives back into array

```
mdadm --manage --add /dev/md0 /dev/hdc1
mdadm --manage --add /dev/md1 /dev/hdc2
```
