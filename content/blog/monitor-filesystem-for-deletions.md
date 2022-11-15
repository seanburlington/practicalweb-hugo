---
layout: post
title: Monitor filesystem for deletions
date: 2012-09-28T11:00:42+01:00
comments: true
tags:
  - drupal
  - linux
  - inotify-tools
---

On a project I'm working on at the moment we have a problem, files are going missing.

We don't know which part of the system could be trashing these files (user uploaded images in this case) and they are on a shared filesystem so there are plenty of places to point fingers.

<!--more-->

I've discovered a very handy toolset [inotify-tools](https://github.com/rvoicilas/inotify-tools/wiki) Which hooks into the Linux kernel and allows you to monitor actions like file deletion.

I my case all I need to do right now is monitor the files on each sytem that has access - and I'm hoping to catch which one does the delete

```bash
# stop monitoring for deletes through the build
[ -f ~/inotifywait.pid ] && kill $(cat ~/inotifywait.pid)

git pull
./build.sh


# if the tool is installed - monitor file delets
which inotifywait &&
{
 nohup inotifywait -mr --timefmt '%d/%m/%y %H:%M' --format '%T %w %f %e' -e delete /var/www/sites/default/files/ &> ~/build-${JOB_NAME}-$(BUILD_NUMBER)-delete.log  &
 echo $! > ~/inotifywait.pid
}

```

This should create a log of any user files that get deleted between builds
