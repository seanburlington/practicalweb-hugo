---
layout: post
title: Drupal Cron getting stuck
date: 2010-02-05T11:02:06Z
comments: true
tags:
  - drupal
  - cron
  - error
---

I've just run into the drupal cron problem again

Cron fails and the error log says

`Attempting to re-run cron while it is already running.`

<!--more-->

- delete from variable where name='cron_semaphore';
- clear caches
- run cron from the web page

That seems to do the trick.

Now cron runs OK fom drush or web.
