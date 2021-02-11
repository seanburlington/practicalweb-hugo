---
layout: post
title: Show what svn update is about to do
date: 2009-01-14T11:31:56Z
comments: true
tags:
  - svn
---

When you want to see what svn update is about to do you may try

`svn update --dry-run`

But this doesn't work.

You can get the results you need by running

`svn status -u `
