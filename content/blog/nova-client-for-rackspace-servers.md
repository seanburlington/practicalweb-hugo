---
layout: post
title: Nova client for rackspace servers
date: 2013-07-02T23:31:03+01:00
comments: true
tags:
- rackspace
- openstack
- nova
---

This took me a little while to figure out how to get the right parameters

I used password instead of API key and account ID instead of tenant ID which seemed to work<


<!--more-->

```bash
nova --username $username --apikey $password --os_tenant_name $accountID --os_auth_url https://auth.api.rackspacecloud.com --os_region_name ORD  list
```
