---
layout: post
title: xdebug and Eclipse
date: 2009-07-21T15:00:15+01:00
comments: true
tags:
  - php
  - eclipse
  - xdebug
  - pdt
---

xdebug is an immensely powerful tool for exploring what your code really does.

You can get a long way using print_r but ultimately this always requires that you predict the path your code will take - and the tricky bit about debugging is you need it when your predications have gone wrong.

It's generally pretty easy to set up

<!--more-->

- install the php5-xdebug package
- check that the Eclipse PHP preferences have xdebug as an option
- if you're debugging locally the default settings should be OK
- create a site configuration in the debug dialog
- set a break point
- start debugging
  If it doesn't work at first restart Eclipse

Check that you have a browser configured in Eclipse

Not all settings seem to be picked up immediately
