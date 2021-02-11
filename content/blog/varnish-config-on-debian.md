---
layout: post
title: Varnish config on Debian
date: 2010-05-14T13:53:50+01:00
comments: true
tags:
  - debian
  - varnish
---

I've just spent too long being very confused as to why varnish wasn't working

I'd forgotten that the Debian version doesn't read the default.vcl config file by default!

You have to edit `/etc/default/varnish` and specify the config type you want.

I was getting the error message

> Error 503 Service Unavailable
>
> Error talking to backend
>
> Guru Meditation: XID:
