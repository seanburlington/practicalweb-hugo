---
layout: post
title: Drupal is not Test Friendly
date: 2009-09-30T11:33:56+01:00
comments: true
tags:
  - drupal
  - unit testing
---

I was originally excited about the embrace that Drupal seemed to have given to testing.

However after spending some time with it I've concluded that Drupal really isn't very test friendly.

Most tests for Drupal are integration tests not unit tests.

That is to say that they test a bunch of components together - not each bit separately.

This is because Drupal components (modules or functions) are not well encapsulated, global variables are used, data is cached within functions,  passed via the database etc.

THis makes it much harder for the developer to create tests that validate functional increments, and means the suite of tests run very slowly.

A while ago I tried to run the tests for Drupal 7 - but gave up waiting after an hour. I was very surprised to find that both database and web server were being hit hard - when I was running on the command line!

Even the integration level testing isn't all that great, it runs in an environment without JavaScript support - so the AJAX functionality can't be tested.

Testing is better than not testing - but having gotten into testing I've found Drupal's environment frustrating.
