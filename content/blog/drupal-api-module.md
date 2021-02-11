---
layout: post
title: Drupal api module
date: 2008-06-03T23:44:55+01:00
comments: true
tags:
  - drupal
  - documentation
---

The Drupal api module is very useful. It's also quite strict in the formats it recognises.

If you are having trouble getting it to recognise your doc-comments make sure you are following the Drupal coding standards

http://drupal.org/coding-standards

<!--more-->

In particular function declarations must be like

```php
<?php
function my_function($param) {
?>
```

Any missing (or extra) spaces will cause the api parser to ignore the function.

You can also include html files in your documentation (just save them anywhere the api module has been set to index).

The `<title>` will be used as the "docblock title" and the `<body>` of the html will be displayed formatted within your site template.

I haven't figured out yet where/if the "docblock title" is displayed

Again the parser is quite strict - you must have an `<h1>` element in the page.

Everything up until the end of the first `<h1>` element is ignored (which seems odd to me) - and the rest as the body of the documentation.
