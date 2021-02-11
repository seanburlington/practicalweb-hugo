---
layout: post
title: SimpleTest - expecting Exceptions
date: 2008-06-30T15:58:23+01:00
comments: true
tags:
  - php
  - drupal
  - testing
---

SimpleTest is a great testing framework for PHP, with a Drupal module available too.

Many tests are based on assert statements, but this patterns doesn't work for functions which are expected to throw Exceptions. As at the time of writing Drupal's simpletest module doesn't catch exceptions and so the whole test run stalls.

In that case the following patterns are often useful.

```php
<?php
try {
  foo($good_input);
  pass('Good input didn\'t throw and exeption');
} catch (MyException $e) {
  $this->fail($e->getMessage());
}

try {
  foo($bad_input);
  $this->fail($e->getMessage());
} catch (MyException $e) {
  pass('Bad input correctly threw an exception');
}
?>
```
