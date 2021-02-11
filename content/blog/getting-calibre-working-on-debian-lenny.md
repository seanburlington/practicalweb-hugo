---
layout: post
title: Getting Calibre working on Debian Lenny
date: 2009-11-25T20:59:19Z
comments: true
tags:
  - linux
  - debian
  - lenny
  - calibre
  - e-reader
---

I recently bought a Sony e-reader, the main Linux package to support this is calibre but I found that it wouldn't automatically sync my ebooks.

http://calibre.kovidgoyal.net/user_manual/faq.html#what-devices-does-app-support The FAQ says

> The linux kernel can export two version of SYSFS, one of which is deprecated.

Apparently Debian Lenny exports the deprecated version and you have to recompile the kernel to undo this.

I wanted to make the minimum change possible to my system and continue using the packaging system : I followed roughly the following steps:

```
sudo aptitude install kernel-package ncurses-dev fakeroot wget bzip2 linux-source-2.6.26
mkdir ~/linux
cd ~/linux
tar -xjf /usr/src/linux-source-2.6.26.tar.bz2
cd linux-source-2.6.26
cp /boot/config-2.6.26-2-686 .config
make menuconfig
```

In the config menu I selected

```
General setup -->
         [] Create deprecated sysfs layout for older userspace tools
```

And made sure I specified a custom revision to differentiate my custom package from the standard one

```
make-kpkg --rootcmd fakeroot --initrd --revision=custom.001 kernel_image kernel_headers
cd ..
sudo dpkg -i linux*deb
```

Then reboot ensuring the new kernel is loaded.

I meant to write this up as I went but I'm doing it a few days later so please take care if following them - and adjust to suit your kernel version etc.

The above sounds like a pain but was actually fairly easy, and calibre is much better than the official Sony software which I tried on a Windows machine but it was slow and kept crashing.
