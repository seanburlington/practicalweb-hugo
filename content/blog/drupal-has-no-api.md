---
layout: post
title: Drupal has no API
date: 2009-09-04T10:17:06+01:00
comments: true
tags:
  - drupal
  - api
  - framework
---

I've been using Drupal for a couple of years now, and know my way around it pretty well.

One of my biggest frustrations though is that it doesn't really have an API.

<!--more-->

Much of the functionality is only really available through the application, you can do things pretty easily by pointing and clicking, but try and automate part of this and you have to step through code, find form handlers, copy-paste parts of the functions and work out what parameters are required.

The example I found most recently was creating a translated version of a page.

My client is using a translation agency, we send them XML, they translate it and return the translated text in XML.

So I start with an English page, send off an XML version, and when I get the XML translation back I need to add a new node related to the original.

But Drupal has no function `translation_add()` instead the functionality is embedded in `translation_nodapi()`.

If Drupal had an API there would be a well thought out set of functions to add, delete, and update translations of a node.

The name of Drupal's documentation site http://api.drupal.org/ is misleading, this is just general documentation of Drupal functions, it isn't an API.
