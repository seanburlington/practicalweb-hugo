---
layout: post
title: Varnish on two ports, with separate backends
date: 2012-11-22T11:44:16Z
comments: true
tags:
  - varnish
---

We have a site with a hardware ssl accelerator wich routes http traffic to port 80 and decrypted https traffic (so back to http) to port 443. We wanted varnish to cache the 443 traffic, and I came up with this proof of concept config, in reality you'd want to have a bunch of different rules for your https site to ensure you cache only what you want to.

in `/etc/varnish/default.vcl`

<!--more-->

```C
backend default {
    .host = "www.example.com";
    .port = "80";
}
backend secure {
        .host = "www.example.com";
        .port = "443";
}



sub vcl_recv {
    set req.http.Host = "www.example.com";
    if (server.port == 7081) {
                set req.http.host = "www.example.com";
                set req.http.port = 443;
                set req.backend = secure;
                return(lookup);
    }
}
```

and in `/etc/default/varnish`

```
DAEMON_OPTS="-a :6081,:7081 \
             -T localhost:6082 \
             -f /etc/varnish/default.vcl \
             -S /etc/varnish/secret \
             -s malloc,256m"

```
