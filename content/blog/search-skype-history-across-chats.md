---
layout: post
title: Search skype history across chats
date: 2013-10-14T17:27:19+01:00
comments: true
tags:
  - skype
---

I find a lot of clients use skype

For me the biggest frustration is the limited search

But it turns out the data is stored using sqlite - and so you can search using sql directly on the sqlite db files.

{{<  gist seanburlington 740d136e58d8b87d057f >}}

or for all your chats from a given day

{{<  gist seanburlington 85e282537f6f2f631414 >}}
