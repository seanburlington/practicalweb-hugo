---
layout: post
title: Returning info from Drupal updates
date: 2010-05-19T17:07:22+01:00
comments: true
tags:
  - drupal
---

Drupal update hooks can return info about queries run - and this is well documented.

If you want to return other informative messages about updates - just use the same format as returned by http://api.drupal.org/api/function/update_sql/6

```php
<?php
array('success' => $result !== FALSE, 'query' => check_plain($sql));

?>
```

So you might have an update hook that looks like.

<!--more-->

```php
<?php
/**
*  Drush picks up notes from here
*  Will update myvar to new val because...
*/
function mymodule_update_6101(){
   $items = array();
   $myval = "foo":
   variable_set('myvar', $myval');
   $items[] = array('success' => TRUE, 'query' = "updated variable myvar to $myval because...");
   return $items;
}

?>
```

This way all changes can be logged to the update page.
