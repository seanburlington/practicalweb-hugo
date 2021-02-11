---
layout: post
title: Instance parameter for drupal field_create_instance($instance)
date: 2011-09-23T17:30:14+01:00
comments: true
tags:
  - drupal
  - drupal 7
  - errata
---

The code in chapter 7 of pro Drupal development has a bug.

The $instance array that you need to pass to [field_create_instance()](http://api.drupal.org/api/drupal/modules--field--field.crud.inc/function/field_create_instance/7) needs to be as below.

Note that the display array has the keyword, 'default' for the default display - ie a node on it's own page 'teaser' looks like the right value for teaser. Other view modes are possible too.

The label field in the display part of the array is just the positioning of the array - 'above', 'below', 'inline' and 'hidden' seem the likely set of allowed values.

NB the display part of the array is optional as Drupal will provide default values.

```php
<?php

array(
    array(
        'field_name' => 'job_post_company',
        'type'       => 'text',
        'label'      => $t('Company posting the job listing'),
        'widget'     => array(
                   'type' => 'text_textfield',
         ),
        'display' => array(
           'default' => array(
               'label' => 'above',
               'type'  => 'text',
         ),
     ),
   ),
);
?>
```

The errata for this book seems to be long and unhelpfully laid out 563 reported errors so far...

http://www.drupalbook.com/errata3

There even seems to be errors in the errata http://www.drupalbook.com/node/269 seems to report this error (or part of it) but I think it's wrong - the array key should be a view mode.
