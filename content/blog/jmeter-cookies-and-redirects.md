---
layout: post
title: jMeter cookies and redirects
date: 2012-04-04T18:02:17+01:00
comments: true
tags:
  - jmter
  - load testing
---

This just took me a while to figure out

I have a jmeter test plan which POSTs to a url, resulting in cookies being set and a redirect

I was not seeing the cookies retained.

The solution was to

enable "Follow redirects" and disable "Auto redirect" on the HTTP request sampler.

Tree view now shows the POST and subsequent GET separately - and the cookies are retained (I am using an HTTP cookie manager)

Another solution if you know what the redirect will be is to disable both redirects and add another sampler for the subsequent GET

This has the benefit that each step can be monitored separately
