---
layout: post
title: Configure Squid proxy server for subversion access
date: 2008-06-24T15:42:32+01:00
comments: true
tags:
  - linux
  - programming
---

To configure the Squid proxy server to work for subversion access you will need to tell it to recognise some non-standard methods.

Add the following to squid.conf

<!--more-->

`extension_methods MKACTIVITY CHECKOUT REPORT MERGE`

Without these settings I could browse the repository - but I couldn't commit to it. Now commit works too :-)
