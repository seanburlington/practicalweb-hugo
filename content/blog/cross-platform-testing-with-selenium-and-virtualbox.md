---
layout: post
title: Cross Platform Testing with Selenium and VirtualBox
date: 2009-04-27T12:04:02+01:00
comments: true
tags:
  - php
  - testing
  - agile
  - virtualbox
  - selenium
---

As well as following standards such as those laid down by www.w3.org I always try and test websites I develop across a range of browsers. Despite improvements in compatibility in recent years, browsers do still vary in implementation and even relatively minor browsers are still used by large numbers of people.

However all this testing can be hard to keep on top of and sometimes I just have to push out what seems like a small code change with only limited testing.

I'm aiming to automate as much testing as possible, this is a little more work up front - but makes re-running tests trivial and so more likely to happen.

<!--more-->

I use VirtualBox to run multiple environments, and am happy to find that the newer releases (2.1 and up) support improved networking.

So I have installed <a href="http://seleniumhq.org/projects/remote-control/">Selenium RC</a> on a virtual machine, and by running this simple script I can test on Internet Explorer - from my Linux development machine.

```php
<?php

set_include_path(get_include_path() . PATH_SEPARATOR . './PEAR/');
require_once 'Testing/Selenium.php';

$selenium = new Testing_Selenium("*iexplore", "http://www.google.com", '192.168.0.7');

$selenium->start();

$selenium->open("/");
$selenium->type("q", "hello world");
$selenium->click("btnG");
$selenium->waitForPageToLoad(10000);
print (preg_match("/Google Search/", $selenium->getTitle())) ? "pass\n" : "fail\n";
$selenium->stop();

?>
```

Note that I can specify which Virtual Machine to test on just by providing the appropriate IP address.

This example is in PHP because that's what I use, it requires the Pear package Testing_Selenium which I installed on Ubuntu by the command

`sudo pear install channel://pear.php.net/Testing_Selenium-0.4.3`

Now all I need to do is integrate this into my unit testing framework and add some scripts to start up and shut down the virtual machines.

There is also Selenium Grid which is aimed at distributing tests across multiple machines in parallel - but as this is all running on one physical machine (my laptop) I don't really want parallelisation here.
