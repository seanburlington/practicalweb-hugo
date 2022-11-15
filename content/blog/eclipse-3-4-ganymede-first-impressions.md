---
layout: post
title: Eclipse 3.4 (Ganymede) First Impressions
date: 2008-07-06T17:20:02+01:00
comments: true
tags:
  - php
  - eclipse
  - programming
---

Well the new version of Eclipse (3.4 or Ganymede) is out and I've been trying it out. So far I've just installed it, adding in the components I want; and generally trying to see what's new.

<!--more-->

## Installation

I'm running Linux (Ubuntu 8.04)

Installing Eclipse 3.4 was a pain: it turns out that Eclipse requires web browser components form Firefox - and didn't work with the default Ubuntu package that I had.  Once I found out that I needed to upgrade my xulrunner-1.9 package things were OK.

If you have these problems see

- http://www.eclipse.org/swt/faq.php#browserlinux
- https://bugs.eclipse.org/bugs/show_bug.cgi?id=213194

Then I needed to install various components, the Eclipse  software updates management is much improved on earlier version, dependencies are resolved automatically. But I still found it hard to work out which packages provide which features. There was quite a lot of back and forth - install, test, install some more ...

Particularly tricky was the subversive svn connector.

## Core Eclipse

While there appear to be lots of small improvements (better updates UI, case preserving search and replace regex...) there doesn't seem to be anything here to get me to upgrade in itself.

## PDT - PHP Development

This isn't actually part of Ganymede, but I downloaded and installed a nightly build as this is the part of Eclipse that I use the most heavily.

Again the changes are incremental - but as this is stuff I use so much small changes can make a big difference.

See http://wiki.eclipse.org/PDT/1.1_Plan

<dl><dt>Mark Occurrences</dt>
<dd>Select a variable or function and all other occurrences of this in the current editor are highlighted (those offscreen are shown in the 'ruler'</dd>
<dt>Better OO support</dt>
<dd>I haven't tested this out enough yet - but there seems to be better support for showing the relationship between classes</dd>
<dt>Code Completion</dt><dt>
<br />
</dt><dd>Previous versions of PDT have relied almost entirely on doc comments for code completion, it looks like this version does a better job where there are no doc comments</dd>
</dl>

This doesn't look like a whole heap of changes, I'd really hoped for some better refactoring support, but what is there is welcome.

## Subversive

I've always used subclipse before - after reading http://www.barneyb.com/barneyblog/2006/10/26/subclipse-vs-subversive/> and going with the recommendation - but that was a couple of years ago.

Now subversive is a standard part of Eclipse - but annoyingly you do have to download the SVN connectors separately - and the documentation is clearly written by a non-english speaker.

Adding the SVNKit component from Polarion finally got things working for me.

It doesn't look all that different so far - except it does recognise the trunk/tags/branches convention which is nice.

## Mylyn

This does appear to have major advances with far deeper integration to Eclipse.

> Mylyn is a Task-Focused Interface for Eclipse that reduces information overload and makes multi-tasking easy.

If you haven't used Mylyn yet - you're missing out.

Mylyn integrates with your task list or ticketing system, keeps track of the files you open for a task, filters out irrelevant info, reopens the right files if you re-open a task, and fills out half the ticket comment for you when you commit work.

There's too long a list of great stuff - see http://www.eclipse.org/mylyn/new/

## Communication Framework

This part of eclipse is completely new to me; I love the idea of being able to jointly edit a file with a colleague.

- http://codesurgeonblog.com/2008/06/cola-real-time-shared-editing.html
- http://wiki.eclipse.org/RT_Shared_Editing
- http://wiki.eclipse.org/DocShare_Plugin
- http://wiki.eclipse.org/ECF_Servers

I have yet to get this working (requires a suitable colleague and server).

It's also possible to run an IRC client inside eclipse (and several proprietary chat protocols) - though I'm less convinced this is useful.

## Datatools

So far this seems like a step backwards, there is an SQL query builder (but I'm happy on the command line); but I found the new connection wizard really confusing, and while I have connected to a database - I can't seem to browse the tables.

## Web Tools

Seems like more incremental improvements, lots of little productivity gains.

http://www.eclipse.org/webtools/releases/3.0.0/newandnoteworthy/sourceediting.php

## Summary

So far it doesn't seem like there are any compelling reasons to upgrade: if you're happy with Eclipse as you have it - stay with it. If the upgrade path was easier maybe I'd have a different answer.

Having got this far though the improvements look generally useful; I'll go ahead and start using Ganymede for day-to-day use.
