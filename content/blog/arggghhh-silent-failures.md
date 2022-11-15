---
layout: post
title: ! "ARGGGHHH - Silent failures! "
date: 2008-02-06T16:08:05Z
comments: true
tags:
  - drupal
  - best practice
---

I’ve just spent ages trying to find out why I couldn’t add some default views to drupal

I’d set up my views, exported them added them to a module in a `hook_views_default_views()` function…

and nothing happened.

<!--more-->

First I though this was caching - but much cache clearing and debugging later…

I realised that if the view requires categories that don’t exist -
it just gets silently dropped - no error - no warning it just doesn’t
work!!!

This seems to be a general Drupal thing - all too often failures are silent - and very hard to track down.
