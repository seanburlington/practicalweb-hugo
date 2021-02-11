---
layout: post
title: Drupal pager_query function
date: 2008-06-29T22:40:44+01:00
comments: true
tags:
  - drupal
---

I've just been trying to get a paged query working with Drupal, and after a frustrating hour I realise the problem is that the function is case sensitive: see http://drupal.org/node/211925

Normally SQL keywords can be in any mixture of upper and lower case letters, Drupal has additional coding conventions which is great.

In this case the coding convention is enforced by making a function silently fail if the programmer has failed to adhere to style guidelines.

If you come across this 'feature' please add your views to the above link.
