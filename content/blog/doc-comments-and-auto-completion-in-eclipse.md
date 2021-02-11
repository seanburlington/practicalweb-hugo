---
layout: post
title: Doc-comments and auto-completion in Eclipse
date: 2008-05-18T19:33:19+01:00
comments: true
tags:
  - php
  - eclipse
  - drupal
  - documentation
---

Using [doc-comments](http://manual.phpdoc.org/HTMLSmartyConverter/HandS/phpDocumentor/tutorial_tags.pkg.html) in Eclipse really helps productivity by providing lots of tool-tip help and auto completion.

A colleague recently pointed out that Eclipse can auto-complete object properties (as long as you use the @property tag). I've found this really helpful and have been creating objects to return pass around - and found it a vwery neat way of working.

I've also been writing functions that may be used on the command line via [drush](http://drupal.org/project/drush), Drupal cron, or via pages.

A pleasant side effect of this is that the MVC pattern is starting to appear much clearer within Drupal. The Controller may be cron, drush, or the menu system, this calls the Model, and triggers a theme function for the View.

Thanks to Bernard at [NobelProg](http://www.nobleprog.co.uk/)
