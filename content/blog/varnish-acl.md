---
layout: post
title: Varnish ACL
date: 2010-10-01T15:36:25+01:00
comments: true
tags:
  - linux
  - varnish
---

To setup an IP based access control list so that only allowed users may access the site.

```C
sub vcl_recv {

  if (!(client.ip ~ testers)) {
    error 403 "Access Denied - server in test mode (IP not in ACL)";
  }

}

acl testers {
    "localhost";
    "www.example.com";
    "192.168.0.1";
}
```

In my case I need to be able to test a dev site but don't want to make it public, we tried using password authentication but that made it harder to test varnish as the authentication headers affected caching.
