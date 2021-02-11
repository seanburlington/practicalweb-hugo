---
layout: post
title: svnversion
date: 2008-10-16T11:25:40+01:00
comments: true
tags:
  - programming
  - svn
---

I just discovered a nifty little utility

Often working copies are only partially updated, this command gives a very quick command-line summary of the state of the working copy.

It's not as rich an output as kdesvn which will colour code all the updateable files, but its a standard part of svn so should always be available.

## Name

svnversion — Summarize the local revision(s) of a working copy.

## Synopsis

```
svnversion [OPTIONS] WC_PATH [TRAIL_URL]
```

## Description

**svnversion** is a program for summarizing the revision mixture of a working copy. The resultant revision number, or revision range, is written to standard output.

TRAIL_URL, if present, is the trailing portion of the URL used to determine if WC_PATH itself is switched (detection of switches within WC_PATH does not rely on TRAIL_URL).

**Examples**

If the working copy is all at the same revision (for example, immediately after an update), then that revision is printed out:

```
$ svnversion .
4168
```

For a mixed-revision working copy, the range of revisions present is printed:

```
$ svnversion .
4123:4168
```
