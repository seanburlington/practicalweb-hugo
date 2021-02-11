---
layout: post
title: svn merges and excess merginfo properties
date: 2011-07-13T09:20:08+01:00
comments: true
tags:
  - svn
---

The main svn server I'm working on has finally upgraded to svn 1.5 - so easier merging is now possible - hooray.

But we've been seeing merges that should only affect one file resulting in property changes on lots of files/directories. This isn't especially harmful - but it is annoying and makes reviewing the merge harder because of the extra noise.

It turns out that this extra mergeinfo is likely because of earlier merges on subtrees http://blogs.collab.net/subversion/2009/11/where-did-that-mergeinfo-come-from/

It is possible to remove the subtree mergeinfo via this command run from the root of the branch

`svn propdel -R svn:mergeinfo ./*`

http://stackoverflow.com/questions/767418/remove-unnecessary-svnmergeinfo-properties

Which should get rid of the problem - I'm just not 100% sure if it throws away important data.

For now I think I'll live with the nuisance - and come back to this if it becomes too annoying or if I gain greater insight into the issue.
