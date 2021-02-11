---
layout: post
title: simpletest vs phpunit
date: 2009-05-06T12:52:49+01:00
comments: true
tags:
  - php
  - drupal
  - testing
---

There are two main options for unit testing PHP: simpletest and phpunit

They both do a lot of the same stuff, both have the ability to run suites of tests and create mock objects.

Simpletest has a built in webTestCase which allows you to perform some integration as well as unit testing.

An example web test for simpletest is:

```php
<?php
    function testDefaultValue() {
        $this->get('http://www.my-site.com/');
        $this->assertField('a', 'A default');
        $this->setField('a', 'New value');
        $this->click('Go');
    }

?>
```

Drupal has extended this further to include functions specific for Drupal login, creating users etc.

PHPUnit on the other hand has Selenium integration so that these sorts of integration tests can be run with a real browser (even with multiple browsers).

PHPUnit also has some useful tools to detect copy pasted code, calculate code soverage of tests, and integrates with Cruise Control

Simpletest's fake browser should be a lot faster to run than Selenium, but can't truly test JavaScript although ther is the facility to code in form changes that would normally occur via script.

Both projects are actively maintained, and supported.

So far I've mostly used simpletest because it's the default for Drupal; but I'm impressed with Selenium, and I'm tempted to use PHPUnit.
