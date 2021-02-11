---
layout: post
title: "creating a patch from cvs "
date: 2008-01-11T16:12:33Z
comments: true
tags:
  - drupal
  - cvs
---

specifically
I wanted to create a patch equal to the changes between two versions of
Drupal - but it turns out that a packaging script adds some info to
releases that isn’t in the cvs version so this doesn’t quite do what I
wanted.

it’s still useful though ...

1. checkout the current version

1. generate the patch as a diff between the previos version and this one

1. optionally run a diff to compare the two versions (cvs and svn) to check they are the same

```bash
cvs -z6 -d:pserver:anonymous:anonymous@cvs.drupal.org:/cvs/drupal \
checkout -d drupal5 -r DRUPAL-5-6 drupal

cd drupal
cvs diff -N -u -rDRUPAL-5-5 -r DRUPAL-5-6 > ../drupal-5-5-to-5-6.txt
cd ..
diff -r drupal-cvs/ drupal | grep -v .svn | grep -v CVS | less
```

In eclipse open the svn drupal project - go to teams - apply patch

and (except for the packaging stuff) you have an updated drupal for your svn repository.
