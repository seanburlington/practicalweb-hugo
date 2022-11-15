---
layout: post
title: subversion + three.co.uk = proxy trouble
date: 2008-06-08T18:25:22+01:00
comments: true
tags:
  - eclipse
  - linux
  - programming
---

If you try to access a subversion repository over http while using a 3G connection from three.co.uk you may receive an error message like.

> svn: PROPFIND request failed on '/repos'
> svn: Processing PROPFIND request response failed: Premature end of file. (/repos)

This is because three.co.uk uses a [proxy](http://en.wikipedia.org/wiki/Proxy_server#Intercepting_proxy_server) to interecept web traffic on their network.

<!--more-->

This proxy does not understand all the [commands that are used by subversion](http://subversion.tigris.org/faq.html#proxy).

It is perfectly possible to access subversion repositories through a proxy - just not through the one at three.co.uk.

Three only filter traffic on port 80 - the standard web port. Well, at least as far as I can tell that's all they do.

So if you can set up subversion to access a different proxy - one that does play nice - then you can access your repository over your 3G connection.

Under Linux the subversion proxy settings are in the file:

`~/.subversion/servers`

Just add settings as below:

```
[global]
http-proxy-host = www.exaple.com
http-proxy-port = 3128
http-proxy-username = nobody
http-proxy-password = secret
```
