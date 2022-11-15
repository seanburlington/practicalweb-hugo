---
layout: post
title: "APC Back-UPS CS 500Ei and Debian etch "
date: 2008-01-17T16:12:33Z
comments: true
tags:
  - linux
  - debian
---

Just got a new UPS and it’s working nicely :-)

Running on Debian Etch I had to upgrade the NUT package but this
worked very simply by bringing in the one from Lenny (in testing)

<!--more-->

added to /etc/apt/sources.list

`deb-src http://ftp.uk.debian.org/debian/ lenny main contrib non-free`

then ran
`apt-get build-dep nut`

as normal user

```
apt-get source nut
cd to nut dir
dpkg-buildpackage -rfakeroot -uc -b
```

then as root installed the .deb created

After that it was just a case of reading the docs and configuring.

I’m using the UPS for my desktop and monitor - it’s drawing 25% load
with a predicted battery runtime of about 45minutes (which I don’t
quite believe)
