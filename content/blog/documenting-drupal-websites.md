---
layout: post
title: Documenting Drupal Websites
date: 2008-05-09T12:43:42+01:00
comments: true
tags:
  - drupal
  - documentation
---

With any sizeable project maintaining good documentation is a challenge - it's all to easy to skimp on documentation, or to start with good intentions but allow the documentation to get out of date.

The [Drupal API project](http://drupal.org/project/api) allows you to set up a documentation website for your project like [api.drupal.org](http://api.drupal.org) that covers all your code.

<!--more-->

The way this works is that you add doc comments to your code, and the Drupal API module extracts these to create the searchable and cross-referenced documentation.

Because doc comments are in the code it is easier to remember to update the documentation when you make a change.
To install the API module:

- Install Drupal

- add [the api module](http://drupal.org/project/api)

- configure the api module

  - short name is used in urls

  - Long name is displayed as the title

  - Directory is the absolute path to the code you want indexed

- Add the special doc comment `@mainpage {title}` somewhere appropriate, this can either be a dedicated documentation page (with nothing but doc comments) or a doc comment in a logical place within your code.

  The key thing is that the {title} must be the same as the "long name" you chose earlier.

- go to the administer blocks page

- enable the API search and API navigation blocks

- run cron a few times to get some pages indexed (by default only \* pages are indexed at a time)

- That should be it
