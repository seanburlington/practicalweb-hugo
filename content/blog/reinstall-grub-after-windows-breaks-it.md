---
layout: post
title: Reinstall grub after windows breaks it
date: 2013-02-12T17:10:34Z
comments: true
tags:
  - linux
  - windows
  - grub
---

One of those things that happens from time to time on a dual boot system...

Windows breaks grub, usually if I've reinstalled windows, this can lead to a unbootable system.

Boot from a Ubuntu (or other distro) live disk or USB stick.

<!--more-->

Figure out which your disks and partitions are.

```bash
sudo mount /dev/sdXY /mnt
# if there is a boot partition
sudo mount /dev/sdUV /mnt/boot
sudo grub-install --recheck --root-directory=/mnt /dev/sdZ
```

When you reboot grub should be back to normal.
