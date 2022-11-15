---
layout: post
title: Hard Drive Testing using smartmontools
date: 2009-12-03T10:18:22Z
comments: true
tags:
  - linux
  - smartmontools
  - reminder to self
---

Test the hard drive with

`smartctl -t long /dev/hd?`

This may take hours to run and will do so as a background process.

<!--more-->

Once complete run the following to see results

`smartctl -l selftest /dev/hd?`
