---
layout: post
title: Jenkins Build artifacts - subdirectories
date: 2012-06-01T16:04:36+01:00
comments: true
tags:
- jenkins
- ci
---

It took me an unreasonable amount of guesswork to figure out how to get jenkins to archive files at multiple folder levels

In the end this line worked for me 

```
Webdriver-framework/target/surefire-reports/*,Webdriver-framework/target/surefire-reports/**/*.png 
```

<!--more-->

This grabs a report in one level - and images it references in subdirectories 

