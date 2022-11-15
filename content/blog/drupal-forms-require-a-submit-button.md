---
layout: post
title: Drupal forms require a submit button
date: 2009-07-06T10:01:04+01:00
comments: true
tags:
  - drupal
  - ajax
  - javascript
---

I'm working on an AJAX heavy site for a defined audience who all have JavaScript - so I have a form with no submit button that gets submitted by an change handler.

<!--more-->

Normally I'd make sure the site was fully accessible - but not on this project so I just got rid of the submit button. I got the JavaScript submit working only to find my Drupal form no longer worked.

It seems that the Drupal submit handlers are not called if the form doesn't have a submit button. I can't see any reference to this in the Drupal API, but adding the  button back in and hiding it via CSS works fine.
