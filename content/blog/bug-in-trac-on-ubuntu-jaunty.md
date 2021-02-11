---
layout: post
title: Bug in Trac on Ubuntu Jaunty
date: 2010-02-02T09:49:21Z
comments: true
tags:
  - ubuntu
  - trac
---

There is a bug in Ubunty Jaunty which cause Trac to have errors.

Attachments do not work, the admin interface for milestones doesn't work properly - and there may be other issues.

The bug report is at https://bugs.launchpad.net/ubuntu/+source/trac/+bug/369792

And the solution is

go to http://packages.ubuntu.com/karmic/trac
and scroll all the way down. There you'll find a download link for the
karmic package which you can download and install via

`sudo dpkg -i trac_0.11.5-2ubuntu1_all.deb`
