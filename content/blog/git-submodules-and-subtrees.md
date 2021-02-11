---
layout: post
title: Git submodules and subtrees
date: 2012-11-26T13:07:37Z
comments: true
tags:
  - git
---

Git has the concept of both submodules and subtrees, there seem to be some problems with each solution, nether being well loved as far as I can see.

Both add significant complexity to a project, and require extra care - but the alternative is monolithic projects or a lot of copy-pasting.

Submodules allow another git repo to be nested inside the main one, you can then commit to either repo from the same filesystem.

The "parent" repo references a specific tag/branch of the child one - it's just this reference which is committed (and can be updated) in the parent.
Commits in the parent relating to changes in subtree just show the ID changing and any message made when committing an updated version of the module. You can see commit history for the submodule when you are in that directory.

The downside here being that neither a regular checkout nor a github tarball includes the child repo which adds overhead to dev build and server deploys.

Subtrees allow an additional external reference to be added and checked out as a subdirectory, this time the whole subdirectory is committed to the parent - but not the reference.

The local repo does hold a reference and this allows the child repo to be merged in (preserving any local patches).

The downside here is that the external reference has to be added manually to any repo that needs it, you don't see the submodule history in the parent.

There's a good article here http://codingkilledthecat.wordpress.com/2012/04/28/why-your-company-shouldnt-use-git-submodules which basically says to use another tool - but that has it's own set of problems.
