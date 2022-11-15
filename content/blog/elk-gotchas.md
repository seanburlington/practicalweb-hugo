---
layout: post
title: "ELK gotchas"
date: 2015-01-16 19:49:03 +0000
comments: true
tags:
  - log analysis
  - elk
  - elasticsearch
  - logstash
  - kibana
---

Syslog import takes current year - and I can't seem to set that (it's early January I'm working on logs that include the end of December)

Even adding a year to the log data in sed didn't seem to help

<!--more-->

Selecting time periods via histogram I had inadvertently setup conflicting time periods or times outside of my data - if "filtering" is collapsed it's very easy for the dashboard to have a filter that leaves no data shown and as a beginner not realise it

Histogram panel view - exposes an \interval\ setting that was wrong in my case (set to an interval of a year which wasn't useful for a few days worth of data)
