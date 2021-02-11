---
layout: post
title: Continuous Integration Testing for Drupal with CruiseControl (part 1)
date: 2009-04-08T19:03:50+01:00
comments: true
tags:
  - php
  - drupal
  - testing
  - svn
  - cruisecontrol
  - unit testing
  - agile
  - phpundercontrol
---

I recently finished work on a project that really suffered from a lack of build tools.

It was a large project, and while many of us were keen on writing tests we weren't able to get management sign of to spend some time automating the test process. So even though we did some of the work we didn't get all the benefits.

It was really frustrating to come back to a piece of work that was well covered by unit tests, only to find those tests broken

Well, right now I've decided to take some time to explore automated testing a bit more. I've got a Drupal site and a bunch of simpletest tests - I want the tests run on every commit, and while I'm at it I want to run some other checks too.

The following records what I've done so far, problems I encountered, and how I solved them.

Download

1. [cruisecontrol](http://cruisecontrol.sourceforge.net/)
1. [phpundercontrol](http://phpundercontrol.org/about.html)
1. [simpletest runner for cruise control](http://demo.codesetter.com/drupal5-macgyver-cruisecontrol)
   (thanks Adnan)

Checkout and configure my Drupal site, create the settings for this as a CruiseControl project.

At this point I had CruiseControl setup, I could see my project, but no useful reports.

Debugging

1. read the logfiles (doh!)
1. run each process separately

CruiseControl is a big beast and trying to debug small parts of it by running it all wasn't much fun.

CruiseControl runs each step of a build via [ant](http://ant.apache.org/)  - this is a fairly standard tool (available via apt-get if you're a Debian user)

Running ant manually gave me much greater visibility of errors that were occurring at this stage (I'd put my test runner script in the wrong place).

```bash
cd cruisecontrol/projects/myproject
ant
```

This gives nice easy to read output for each step of the build.

Once CruiseControl has built your project it merges the xml logfiles; the merged file is stored in cruisecontrol/logs/myproject/

The web application part of CruiseControl uses xsl to transform these logfiles into output, and a little jsp to select which xsl files to use. Again I found it easier to debug the xsl part of the process by running the xsl manually (either on the combined logfile - or individual ones wrapped in <cruisecontrol> tags).

`xsltproc webapps/cruisecontrol/xsl/checkstyle.xsl projects/myproject/build/logs/checkstyle.xml`

And what I found was that my xml log wasn't xml after all (I'd hit a [bug in phpcodesniffer](http://pear.php.net/bugs/bug.php?id=14409) which was outputting error messages at the top of the file).

Right now I have a continuous integration server up and running. It's not quite how I want it yet but now I understand how CruiseControl works I don't think it'll take too long to get right - but it's the sort of thing that I expect to grow and tweak as I go along.

I've found CruiseControl hard to setup, seen too many Java stacktraces, and blank screens when xsl didn't work as expected.

Some things could probably be done better via svn commit hooks (if you have access to the svn server), and certainly it would have been faster to cobble together some cron jobs.

But I've persevered because CruiseControl comes with a wealth of plugins including many version control systems, and many notification methods. I'm hoping that I've overcome the initial learning curve and will start to reap the rewards.
