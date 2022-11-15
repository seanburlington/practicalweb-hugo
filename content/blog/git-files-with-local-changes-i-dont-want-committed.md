---
layout: post
title: git files with local changes I don't want committed
date: 2013-03-25T12:15:13Z
comments: true
tags:
  - git
---

I'm working on a project where I find I want to semi-regularly adjust a config file for local testing, but want to be sure I don't commit that file by mistake.

Seems the best approach is

`git update-index --skip-worktree $filename`

This tells git to skip this file when I push, if the remote file changes it will warn me

<!--more-->

To switch back

`git update-index --no-skip-worktree $filename`

There is also a assume-unchanged option - but this is aimed more at performance and bug workarounds - it realy does assume the file is unchanged - which in my case is incorrect.
