---
layout: post
title: Git log of live site vs master
date: 2012-07-16T16:01:02+01:00
comments: true
tags:
  - git
---

One liner to grab a git log summarising what will change when you push teh next release.

For this to work you need to keep the deployed tag in VERSION.TXT

`git log --oneline --graph $(GET http://www.example.com/VERSION.TXT)..$(git describe --abbrev=0 --tags origin/master)`
