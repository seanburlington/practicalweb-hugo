---
layout: post
title: Can't login to Drupal (404)
date: 2012-04-25T10:40:49+01:00
comments: true
tags:
  - drupal
  - apache
  - mod-rewrite
---

I've been working on a project for a while on my main dev machine, but needed to run it on my laptop too.

Usually copying a site across is quick but this time I re-installed the OS too, everything went OK except for some reason I couldn't log in to my drupal site.

Eventually I noticed that while the site appeared to be working, every page was being served with a 404 header.

<!--more-->

What happened is that I hadn't enabled mod_rewrite

The .htaccess had been configured to serve drupal 404 pages, but in this case Drupal (once started as a 404 handler) correctly processed the URL - but presumably without the form data.
