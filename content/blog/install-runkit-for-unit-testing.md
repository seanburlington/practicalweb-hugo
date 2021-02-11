---
layout: post
title: Install runkit for unit testing
date: 2008-07-24T17:37:59+01:00
comments: true
tags:
  - php
  - drupal
  - testing
---

Unit testing Drupal can be pretty challenging as it's hard to isolate parts of the code.

It seems :

- [Unit Testing Plan](http://drupal.org/node/237959?mode=2&sort=2)
- [Drupalcon: Simpletest and the Future of Test-Driven Development in Drupal](http://www.lullabot.com/blog/drupalcon-simpletest-and-future-test-driven-development)
- http://groups.drupal.org/node/9412
- [Drupal Unit Testing](http://dhubler.googlepages.com/drupalunittestingusingstandardtools)
- [Unit testing plan](http://groups.drupal.org/node/10957)
- [Mock function testing in Drupal](http://www.workhabit.org/mock-function-testing-drupal)
- [Mocking Functions in Simple Test](http://www.phppatterns.com/docs/develop/simpletest_mock_functions)

that [runkit](http://us.php.net/runkit) together with Drupal's implementation of SimpleTest is the way to go..

I found it a bit tricky to install on Linux (Ubuntu)

Some windows installers seem to have it built in but for those of us who like our dev and live environments to be similar:

Download runkit from cvs (I found the beta version to have bugs)

```bash
sudo aptitude install php-pear
sudo aptitude install php5-dev

mkdir temp
cd temp

cvs -d:pserver:cvsread@cvs.php.net:/repository co pecl/runkit
cvs -d:pserver:cvsread@cvs.php.net:/repository co pecl/runkit

cd pecl/runkit
phpize
./configure
make

sudo  cp /home/sean/temp/pecl/runkit/modules/runkit.so /usr/lib/php5/20060613+lfs/
```

edit /et/php5/apache2/php.ini

add the line

```
extension=runkit.so
```

restart apache

phpinfo() should now show

```html
<h2><a name="module_runkit">runkit</a></h2>
<table>
  <tbody>
    <tr class="h">
      <th>runkit support</th>
      <th>enabled</th>
    </tr>
    <tr class="h">
      <th>version</th>
      <th>1.0.0-dev</th>
    </tr>
    <tr class="h">
      <th>Custom Superglobal support</th>
      <th>enabled</th>
    </tr>
    <tr class="h">
      <th>Sandbox Support</th>
      <th>disable or unavailable</th>
    </tr>
    <tr class="h">
      <th>Runtime Manipulation</th>
      <th>enabled</th>
    </tr>
  </tbody>
</table>
```

Now all I've got to do is use it to build some tests...
