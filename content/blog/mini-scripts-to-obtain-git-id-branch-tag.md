---
layout: post
title: mini scripts to obtain git id/branch/tag
date: 2013-02-05T16:42:05Z
comments: true
tags:
- git
---

```bash
$new_branch=$1 # passed as param

current_branch="$(git symbolic-ref HEAD 2>/dev/null)"
current_branch=${current_branch##refs/heads/}

current_id=$(git rev-parse --short origin/$current_branch)

new_id=$(git rev-parse --short origin/$new_branch)

last_tag=$(git describe --abbrev=0 --tags)

```
<!--more-->

.