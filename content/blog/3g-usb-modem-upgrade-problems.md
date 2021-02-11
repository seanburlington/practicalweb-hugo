---
layout: post
title: 3G USB modem - upgrade problems
date: 2008-06-04T13:32:48+01:00
comments: true
tags:
  - linux
---

After an upgrade I found my 3G USB modem wasn't loading properly.

For some reason the airprime module was connection to ttyUSB0
making it unavailable.

To fix this I just added the airprime module to the blacklisting in

```
/etc/modprobe.d/blacklist
```

<!--more-->

I'm running Ubuntu 8.04 (Hardy Heron)
Linux 2.6.24-16-generic
and the Huawei E220 HSDPA Modem
