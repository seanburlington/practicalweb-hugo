---
layout: post
title: Reading a unicode Excel file in PHP
date: 2008-05-18T22:02:59+01:00
comments: true
tags:
  - php
  - internationalisation
  - unicode
---

It's easy to save an Excel file as CSV and read it in PHP with the [fgetcsv](http://www.php.net/fgetcsv) function but this may not work so well if the file contains non-English characters.

Excel uses a non-standard character encoding for csv files.

You can save an Excel file as 'unicode' text however there are several unicode systems - Windows uses UTF-16, and PHP uses UTF-8.

To open the 'unicode text' file in PHP you have to convert it, in addition you may want to be able to open UTF-8 files that may be created by other systems.

<!--more-->

PHP has an encoding detection function - but it can't detect UTF-16.

I've solved the problem with the following function which detects from several encodings, adds an appropriate filter, and returns a filehandle which reads as UTF-8.

{{<  gist seanburlington 1238ffbd56db3b7c8d5b >}}
