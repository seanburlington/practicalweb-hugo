---
layout: post
title: Import an svn repository to git
date: 2011-05-14T12:26:13+01:00
comments: true
tags:
  - svn
  - git
---

You'll need to have git and git-svn installed.

The code samples are run in bash on Linux.

<!--more-->

## Initial Import

The import process can be slow if you have a lot of history to import as git-svn has to pull in every single revision individally. I've found it worthwhile creating a tiny svn repository to practice with as imports are quick and mistakes cheap.

```bash
mkdir mynewgitrepo
cd mynewgitrepo
git svn init <svn repo url>  --tags=tags --branches=branches --trunk=trunk --prefix=svn
git svn fetch  # this takes ages
```

You can use git-svn rebase to pull in further updates from svn and git-svn dcommit to commit back.

NB - if you are doing a one shot import and abandoning svn the look into the
[authors-file and no-metadata options](http://www.au.kernel.org/software/scm/git/docs/git-svn.html)

- though [git-filter-branch](http://www.au.kernel.org/software/scm/git/docs/git-filter-branch.html) may be a better way of cleaning up the history.

## Local and remote Branches

git-svn creates remote branches that track changes in the svn repository, if you want to work on these branches you will need local copies, I've used the prefix "svn" on importing which will be applied to the remote branches which allows me to create local branches with the same name as is used in svn.

To create a local copy of branch 1.0

```bash
git branch 1.0 svn/1.0
```

To create local copies of all svn branches

```bash
for branch in $(git branch -r | grep -v tags | grep -v trunk) ; do echo git branch ${branch#svn/} $branch ; done > local_branches
# review local_branches file
. local_branches
```

NB when a new branch is created in svn it won't appear automatically in git - use git svn fetch to achive this and then create a local copy of it if needed.

## Tags

Subversion doesn't really distinguish between tags and branches - there is just a convention that copies of trunk are stored in "branches" for further commits and in "tags" to be left as a record of a a point in time. But you can in fact continue to work on subversion tags.

What git-svn does is to import tags as branches prefixed with /tags if the tag has commits git-svn creates a branch for each commit named tags/$tagname@$revison_id

If you want to you can make true git tags from these and delete the git branches - though you will (presumably) lose the ability to obtain further updates on these later.

```bash
for tag in $(git branch -r | grep tags) ; do echo "git tag ${tag#tags/} $tag && git branch -r -d $tag "; done > converttags
# review converttags file
. converttags
```

## Further git settings

Migrate svn ignore settings

```bash
git-svn show-ignore > .gitignore
```
