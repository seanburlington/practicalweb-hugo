---
layout: post
title: Make Drush support PHP-5.1
date: 2009-12-30T13:16:18Z
comments: true
tags:
  - php
  - drupal
  - drush
  - redhat
  - json
---

Drupal has a fairly easy to meet set of requirements http://drupal.org/node/502452

But Drupal projects are free to set their own rules in this area and Drush has used functions only available in PHP 5.2 - as far as I can see this is just the json functions.

Frustratingly the latest version of RedHat provides PHP 5.1 and this is the second time I've run into the problem with a client who uses RedHat and understandably wants to stick to the standard packages.

Drush provides command line access to Drupal functions and so is incredibly useful - but not quite critical enough for a platform re-evaluation.

Since my project was using a JSON class anyway I decided to get Drush working using this class instead of requiring PHP 5.1

http://drupal.org/node/502452
