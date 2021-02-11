---
layout: post
title: ! "Using PHP and curl with http PUT on string data "
date: 2011-09-21T15:59:40+01:00
comments: true
tags:
  - php
  - http
---

This wasn't obvious

There are various other posts on this - but mostly assuming you will put a file.

In my case I want to put the contents of a string so I needed to create a temporary filehandle.

```php
<?php

function put_it($url, $string) {
  $ch = curl_init($url);
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
  curl_setopt($ch, CURLOPT_PUT, TRUE);
  // create tempoary file handle
  $oneMB = 1024 * 1024;
  $fp = fopen("php://temp/maxmemory:$oneMB", 'r+');
  fputs($fp, $string);
  rewind($fp);
  curl_setopt($ch, CURLOPT_INFILE,  $fp);
  curl_setopt($ch, CURLOPT_INFILESIZE, strlen($string));
  $response = curl_exec($ch);
  fclose($fp);

?>
```
