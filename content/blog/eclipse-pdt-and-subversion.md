---
layout: post
title: Eclipse PDT and Subversion
date: 2008-11-02T17:21:34Z
comments: true
tags:
  - php
  - eclipse
  - ubuntu
  - svn
---

## Version conflicts to be aware of

Ubuntu 8.10 (Intrepid Ibex) now ships with Subversion 1.5

You can't use a svn 1.4 client and a svn 1.5 client on the same working copy.

<!--more-->

While the subversion integration in Eclipse is great I still prefer to do some things on the command line and some with kdesvn.

Then you need to upgrade your subclipse plugin to subclipse 1.4

If you can - then upgrade to Eclipse 3.4

But Eclipse 3.4 doesn't run the latest stable version of PDT - and last time I tried to use an Integration build it was unusable - I may try again sometime but right now I want a small upgrade.

I followed this instructions here http://subclipse.tigris.org/install.html

But Eclipse reported a "Network problem"

So I downloaded the zip file
http://subclipse.tigris.org/files/documents/906/43792/site-1.4.5.zip

Unpacked it in a folder on my local webserver, pointed Eclipse at this location and the installation worked!

Phew - I have a working Eclipse for PHP development on Ubuntu 8.10
