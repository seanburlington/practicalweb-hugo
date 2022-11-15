---
layout: post
title: CVS for subversion users
date: 2009-12-30T16:24:18Z
comments: true
tags:
  - svn
  - cvs
  - reminder to self
---

I've been using version control for a long time, but I haven't used CVS much since the first day I tried Subversion.

(Git seems great but isn't the same kind of drop-in upgrade that CVS to Subversion was)

Things I forgot

<!--more-->


1. CVS doesn't do the nice recursive add that subversion does
   At the start of a project you need to run
   cvs import
1. CVS expands keywords by default - this is a problem if like me you want to merge in changes from someone else CVS repository as both sites have changes the keywords
   Disable keyword changing by updating with
   `cvs up -d -ko`
1. CVS doesn't add back deleted directories
   `cvs up -d`
1. CVS doesn't have a nice equivalent of svn status
   `cvs -q up`
   Not quite the same as it will update stuff - but it does tell you which local files have changed
1. Tagging seems OK but doesn't quite do the same thing
   `cvs tag`
