---
layout: post
title: Easy Drupal Upgrades using Subversion
date: 2010-03-15T14:21:37Z
comments: true
tags:
  - drupal
  - svn
  - upgrade
---

I've long been puzzled by the [official advice on upgrading Drupal](http://drupal.org/upgrade/downloading-drupal-gui)

It basically says you should delete everything, unpack a new Drupal version, and replace your customisations.

I like to use version control to manage my site.

My current project uses the pressflow fork of Drupal, I downloaded the current and new versions of this, added them to my repository and then upgrading my working copy is as easy as

```
svn merge --ignore-ancestry https://example.com/svn/vendor/pressflow-6.15.73 https://example.com/svn/vendor/pressflow-6.16.77 ./
```

This merges in all the changes (including file/directory additions/deletes).

Then I play around with the newly upgraded site, have a look at the code that changed, check all is OK and when I'm happy - commit the changes.

If I later find a bug that might be related to an upgrade I've got the changes ready via the usual tools (annotate, log, diff).

Even better - this retains any changes I've made to core without any need to keep a list of patches. If the core update contains a fix I've applied locally then I'll get a conflict which I can resolve.
