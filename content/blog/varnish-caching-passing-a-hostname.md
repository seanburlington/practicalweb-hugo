---
layout: post
title: Varnish caching - passing a hostname
date: 2010-05-13T17:59:52+01:00
comments: true
tags:
  - linux
  - varnish
  - development
---

I'm using varnish to cache a REST service that's slow enough to cause me grief in development.

Out of the box it assumes you are caching your own server and that the client is already using the right host header.

To specify that it should use a host header to match the backend I'm using a config like

```C
backend default {
        set backend.host = "www.example.com";
        set backend.port = "80";

}


sub vcl_recv {
        set req.http.host = "www.example.com";
}

```
