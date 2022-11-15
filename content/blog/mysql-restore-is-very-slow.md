---
layout: post
title: MySQL restore is very slow
date: 2008-08-04T14:11:51+01:00
comments: true
tags:
  - mysql
  - ubuntu
---

It seems there is a bug in MySQL which is causing restores to run very slowly (hours instead of minutes)

http://bugs.mysql.com/bug.php?id=33057

The bug is fixed in http://dev.mysql.com/doc/refman/5.0/en/releasenotes-cs-5-0-67.html

But Ubuntu hasn't updated yet....

<!--more-->

Fortunately this bug is specific to the command line client.

Workaround: use the MySQL Administrator GUI instead.
