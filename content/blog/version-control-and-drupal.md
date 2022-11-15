---
layout: post
title: "Version Control and Drupal "
date: 2008-01-03T16:12:33Z
comments: true
tags:
  - drupal
  - svn
  - cvs
---

I’ve been using open source software and developing php for a decade or so now - but until recently the two have been fairly separate.

Now I’m working on Drupal I need to keep track of my work - and merge in the changes from ‘upstream’.

here’s the useful info I found ...

<!--more-->

Drupal advise

Drupal.org » Forum » Support » Post installation : Repository setup

[http://drupal.org/node/118936](http://drupal.org/node/118936)

Vendor Branches

[http://svnbook.red-bean.com/en/1.0/ch07s04.html](http://svnbook.red-bean.com/en/1.0/ch07s04.html)

Subversion Externals

[http://svnbook.red-bean.com/en/1.0/ch07s03.html](http://svnbook.red-bean.com/en/1.0/ch07s03.html)

svn load dirs (need for upgrading the vendor release)

[http://docs.ofbiz.org/display/OFBIZ/SVN+Tips+-+svn_load_dirs+Vendor+Branch](http://docs.ofbiz.org/display/OFBIZ/SVN+Tips+-+svn_load_dirs+Vendor+Branch)

CVS to subversion scripts

[http://drupal.org/node/71232](http://drupal.org/node/71232)

Update Status (to track new modules)

[http://drupal.org/project/update_status](http://drupal.org/project/update_status)

In the end I’ve decided to put all my projects in one repository (I’ll need to upgrade trac 0.11 soon to host project management on a per project basis)

Each project has a copy of drupal core + contrib modules I plan to use svn:externals to link in my own modules
