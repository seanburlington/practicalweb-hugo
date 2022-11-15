---
layout: post
title: script to email git log as part of a dev deploy
date: 2012-07-12T15:49:56+01:00
comments: true
tags:
  - bash
  - ci
  - deploy
---

This script makes sure the dev site is clean, emails a log summary of updates about to be applied, updates the site and emails me so I know what changed.

I'm using this on a dev site which is periodically updated to the latest master for testing.

<!--more-->

```bash
#!/bin/bash

cd /var/www/site

git stash
git checkout master
git fetch
git log --oneline master..origin/master | mail -s "site updated " me@example.com
mit merge origin/master
./build.sh

```
