---
layout: post
title: Log output of a script to a file
date: 2012-07-12T15:46:48+01:00
comments: true
tags:
  - bash
---

Nice bit of bash fu I discovered today

Add this snippet to the top of scripts and the output of lines below will be tee'd to a logfile.

Handy for those scripts you always want a log of

<!--more-->

```bash
#!/bin/bash

# log all output
[ -d ~/logs/ ] || mkdir ~/logs/
exec > >(tee -a ~/logs/${release}.log)
exec 2> >(tee -a ~/logs/${release}.log)

# do stuff ...
```
