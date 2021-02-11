---
layout: post
title: Blocking git commits from future merges
date: 2013-08-15T17:49:24+01:00
comments: true
tags:
  - svn
  - git
  - version control
---

I used to use subversion and [svnmerge](http://www.orcaware.com/svn/wiki/Svnmerge.py) a lot, and there's just one thing I miss about it. Now svnmerge is a tool to bolt on merge tracking to svn, and gits merge tracking is vastly better in many ways. But the one thing that svnmerge allowed me to do that was cool and doesn't have a real equivalent in git is to block commits

I use release branches as well as feature branches, so for each release we support we have a branch, new features are developed in feature branches off this - and merged back to it when complete. The branch for release x gets merged forwards to release x+1 periodically - to ensure that any features or bugfixes make it to the latest release.

Sometimes we make a commit to an older release that we don't want to merge forwards to newer releases - typically this is a quick and dirty bugfix/workaround that is superseded by a proper fix in the next release.

Svnmerge allowed you to "block" these commits so that they did not get merged forwards, with git you could cherry-pick around these commits - but you'd loose the ability to do regular merges.

What you can do it git is to merge the commit - but keep the files unchanged, this looks a bit weird but works OK.

`git cherry-pick -e --strategy=ours $hash`

The strategy=ours bit means keep the code as it was in this branch. -e lets you edit the commit message to indicate it isn't a normal merge

Now sometimes this doesn't seem to work, git complains that the commit is empty, I think this is when there is a conflict - in this case the only way I have worked around it is to do a regular cherry-pick and resolve the conflict manually - effectively undoing the commit. Then `commit --allow-empty`
