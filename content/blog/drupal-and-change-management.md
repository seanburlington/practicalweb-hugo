---
layout: post
title: Drupal and Change Management
date: 2008-02-25T09:06:35Z
comments: true
tags:
  - drupal
  - best practice
  - cms
---

Any complex website that needs updating has to be tested without affecting the users of the live site.

The challenge then is how to replicate the changes made on your test site on the live site.

If all the changes are in code then version control systems such as svn and cvs solve this problem very neatly.

But with a CMS such as Drupal some changes are inevitably required in the database.

Managing these changes without affecting the site content can be tricky.

<!--more-->

This isn't just a Drupal problem - I've encountered in on most web applications and CMS's I have worked on.

My current solution is based on very careful documentation of the database changes - but I'm always on the lookout for more automated solutions.

Three useful Threads on Drupal:

- http://groups.drupal.org/change-management-systems
- http://drupal.org/node/140430
- http://groups.drupal.org/node%252F786

There is also a macro recording facility in the devel module
http://drupal.org/project/devel

Also interesting is this work calculating the dependency diagram for Drupal modules
http://drupal.org/node/220945#comment-738292
