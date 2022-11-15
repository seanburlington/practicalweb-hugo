---
layout: post
title: Varnish logs twice
date: 2010-10-05T14:24:51+01:00
comments: true
tags:
  - linux
  - varnish
---

The default configuration of varnish logs every request twice, once for the client and once for the backend communication

edit the line in `/etc/init.d/varnishncsa` to something like

<!--more-->

`DAEMON_OPTS="-c -a -w $logfile -D -P $pidfile"`

from the varnishncsa man page

> -c Include log entries which result from communication with a client. If neither -b nor -c is specified, varnishncsa acts as if they both were.
