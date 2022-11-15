---
layout: post
title: Testing PHP
date: 2009-05-12T17:40:56+01:00
comments: true
tags:
  - php
  - testing
  - unit testing
  - testfest
  - phplondon
---

I had fun this weekend at the [PHP London](http://www.phplondon.org/) Test Fest, it was a great opportunity to learn something new and meet some great programmers.

The tests our team took on were based around the [SPL](http://www.php.net/%7Ehelly/php/ext/spl/main.html)[iterators](http://uk.php.net/manual/en/spl.iterators.php) I hadn't used this part of PHP before and it was a great way to learn about it, especially as many of the functions we tested aren't documented yet.

<!--more-->

What we did was :

1. Take a copy of [PHP source code](http://www.php.net/anoncvs.php)

2. extract this and run ./configure

3. create a short script to run tests

4. and another to run the checked out version of PHO

5. Check the [test coverage reports](http://gcov.php.net/PHP_5_3/lcov_html/spl/spl_iterators.c.gcov.php)

6. Find an untested section of code (in red)

7. Figure out what it does

8. Write a test to run this part of code

9. go to 5

More details on how to write tests are at http://qa.php.net/write-test.php

I found the hardest bit was interpreting the C source code of PHP - this was made much easier by the mentors at the test fest, and once pointed in the right direction we were able to get going easily enough.

This does give me another reason to read this book:

[![Extending and Embedding PHP Sara Golemon](http://ecx.images-amazon.com/images/I/415rN3jdDvL._SL160_.jpg)](/review/extending-and-embedding-php)

One thing I didn't figure out on the day - in order to regenerate the coverage reports and check that the new tests do add coverage I needed to

```bash
aptitude install lcov
make lcov TESTS=./path-to tests
```

NB you can either run all tests or just a subdirectory

The script to run tests was

`#!/bin/bash export TEST_PHP_EXECUTABLE=/path-to/php5.3-200905081030/sapi/cli/php $TEST_PHP_EXECUTABLE /path-to/php5.3-200905081030/run-tests.php $*`

I also created an alias to `sapi/cli/php` so that I could run the tests as simple PHP scripts
