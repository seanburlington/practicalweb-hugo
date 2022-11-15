---
layout: post
title: SVN diff ignoring whitespace
date: 2008-11-21T11:08:58Z
comments: true
tags:
  - svn
---

It's often handy to look at the changes made by a commit ignoring whitespace changes.

<!--more-->

This is often required when a developer has made some formatting changes and you just want to see the functional differences.

`svn diff --diff-cmd diff -x -uw`
