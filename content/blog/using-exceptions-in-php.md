---
layout: post
title: Using Exceptions in PHP
date: 2009-03-26T14:10:05Z
comments: true
tags:
  - php
  - drupal
---

The Drupal project I've been working on for the last year involved some fairly heavy file processing, with lot's of validation.

To simplify the code I made extensive use of Exceptions, I didn't create that many different Exception classes - but I made sure that any errors which affect the flow of the logic were handled by Exceptions.

<!--more-->

This succeeded in making the code much more legible.

And now several months later I'm updating documentation - and it's just great to be able to spot all the error handling code so easily.

It's  a shame Drupal doesn't use exception handling more in the core.
