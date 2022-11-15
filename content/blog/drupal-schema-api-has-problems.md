---
layout: post
title: Drupal Schema API has problems
date: 2009-06-22T11:40:38+01:00
comments: true
tags:
  - php
  - drupal
  - sql
  - orm
  - schema api
---

[An interesting post from Lullabot](http://www.lullabot.com/articles/drupocalypse-now-or-dangerous-integer-handling-drupal-write-record) today on problems with Drupal's Schema API and the [Twitpocalypse](http://www.google.co.uk/search?q=Twitpocalypse)

It turns out that [the Schema API](http://drupal.org/node/333788) doesn't properly understand the difference between different types of integers

<!--more-->

I was already concerned that
[Schema API](http://drupal.org/node/200953) lacks the 'time' and 'date' type

I don't really understand why the Drupal team has decided to try and roll it's own database abstraction layer, and make it a core part of the system in the current state.

There seem to be [quite a few bugs](http://drupal.org/project/issues/search/drupal?text=&assigned=&submitted=&participant=&status[]=Open&priorities[]=1&priorities[]=2&categories[]=bug&version[]=6.x&component[]=database+system&issue_tags=)
