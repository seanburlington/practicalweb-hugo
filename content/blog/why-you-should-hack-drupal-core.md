---
layout: post
title: Why you should Hack Drupal Core
date: 2008-12-01T17:16:58Z
comments: true
tags:
  - drupal
---

OK - so I'm a heretic.

This is absolutely against the accepted Drupal Dogma.

What's great about Drupal is that you can achieve most things without hacking the core codebase; this means that every Drupal installation has the same base and any good developer who knows Drupal can take over the site.

But ....

There are things you cannot achieve by writing modules or theming.

For example: Drupal has a "database connection failure" page which it displays if database fails, this page cannot be themed and shows the Drupal logo. If you want to show a custom page you have to hack core: modules and themes don't get loaded unless the databases says so.

Some suggest logging a support query - or supplying a patch for Drupal - but since feature requests are not accepted for released versions of Drupal this seems somewhat futile to me.

This is especially the case if you have been using Drupal as a framework - the API is not backwards compatible so you cannot reasonably upgrade.

The only downside to hacking core is that you have to maintain this change through Drupal upgrades.

My preferred way to upgrade Drupal is by keeping each release in subversion in a separate folder from my project, then I merge the changes between Drupal releases to my site. This is easy, keeps a good record of changes, and retains my hacks.
