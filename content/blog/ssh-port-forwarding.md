---
layout: post
title: ssh port forwarding
date: 2010-02-19T11:54:02Z
comments: true
tags:
  - linux
  - ssh
  - port forwarding
---

Every now and again I find I have ssh access to one server - which has access to somewhere I need to get to - but I want direct access (eg to forward an X session)

```bash

ssh -L 2222:otherserver:22 server

ssh -X -p 2222 localhost

```

an now I'm logged into othersever with forwarded X
