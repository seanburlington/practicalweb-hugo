---
layout: post
title: Ubuntu on a Samsung N150 netbook
date: 2010-09-06T08:25:53+01:00
comments: true
tags:
  - linux
  - ubuntu
---

Installing Ubuntu on a new netbook proved remarkably easy once I got past a couple of hurdles

<!--more-->

- BIOS settings - in order to install a new OS I needed to configure the BIOS to boot from a USB key. At first it seemed like the netbook didn't offer this option and I found several posts online from people having similar problems - but posts from others who had succeeded encouraged me and in the end I just had to guess the right points in the boot sequence to press the escape key and see a BIOS menu
- Bootable USB key, I followed the instructions at http://www.ubuntu.com/desktop/get-ubuntu/download but no matter what the USB key wouldn't boot.

So I repartitioned and reformatted it on an existing Linux system, ran the USB Installer software again and this time it worked.

- Wireless network driver, I needed to update the system (over a wired network) before this worked - just following onscreen prompts.
  As far as I can see everything now works (video, audio, webcam, wifi, power management etc)

I have a dev version of my current web project running with MySQL and Apache, MP3s play, I have a full office suite and all the utilities I could wish for.

I was impressed by the USB installers live mode allowing me to run Linux on the system before installing it fully, and then to repartition the hard drive leaving me with a dual boot system.

I wasn't impressed with Windows though - very slow to get up and running (an hour of installs, updates and reboots - on a pre-installed system?!)  Constant alerts from the security software - and no useful software installed on the base system.
