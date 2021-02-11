---
layout: post
title: How to enter a multibyte Unicode string in PHP
date: 2008-05-23T17:14:15+01:00
comments: true
tags:
  - php
  - internationalisation
---

This has just taken me a surprisingly long time to work out ...

I needed to output a file with the following as a marker in various places.

> ♦ U+2666 BLACK DIAMOND SUIT
>
> General Character Properties
>
> Unicode category: Symbol, Other
>
> Various Useful Representations
>
> UTF-8: 0xE2 0x99 0xA6
> UTF-16: 0x2666
>
> C octal escaped UTF-8: \342\231\246
> XML decimal entity: &amp;#9830;

OK so I know the hex code I think I'll just use [chr()](http://uk.php.net/chr) but no... this only works for ASCII...

...and the mbstring functions are great for working with multi-byte strings but don't help enter them

It turns out that you can either copy a literal ♦ into your source code - or use the [pack()](http://uk.php.net/pack) function

```php
<?php
header('Content-Type: text/plain;charset=utf-8');
echo "♦\n";

echo pack("ccc", 0xE2, 0x99, 0xA6) ."\n";


?>
```
