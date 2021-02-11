---
layout: post
title: Configuring WIFI with Debian
date: 2009-07-21T23:16:08+01:00
comments: true
tags:
  - linux
  - debian
  - hardware
  - wifi
  - iwl3945
---

I've just installed Debian Lenny and generally am impressed with how well things are auto detected and configured - so much easier than a few years ago - and in many ways easier than a Windows install where you have to constantly find 3rd party drivers to get things working.

However getting wifi running was a bit trickier (largely because of FCC regulations  affecting licenses and default settings).

This document got me most of the way

http://wiki.debian.org/iwlwifi

Additional lines in /etc/.network/interfaces

```
iface wlan0 inet dhcp
  pre-up ip link set wlan0 up
  wpa-driver wext
  wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf

```

and wpa_supplicant.conf looks like

```
ctrl_interface=/var/run/wpa_supplicant

network={
     ssid="mynetwork"
     psk="mypassword"
}
```

And it's all working...

This old bug seems to be fixed

https://bugs.launchpad.net/ubuntu/+source/linux/+bug/288401
