---
layout: post
title: Triggers in Drupal
date: 2010-04-30T16:11:05+01:00
comments: true
tags:
  - drupal
---

To make a Drupal module that provides triggers you need to

<!--more-->

## Use `module_invoke_all` at the point your code triggers an event.

```php
<?php
module_invoke_all('mymodule', $op, $arg1, $arg2, ....);
?>
```

This basically defines a hook that your module provides - it has to be called after the name of your module because of [a bug](http://drupal.org/node/368573)

## Define your modules implementation of this hook to run any actions registered for it.

```php
<?php

function mymodule_mymodule($op, $arg1, $arg2...){
  $aids = _trigger_get_hook_aids('mymodule', $op);
  $context = array(
    'hook' => 'mymodule',
    'op' => $op,
    'arg2' => $arg2,
     (arg3 etc)
  );
  actions_do(array_keys($aids), $arg1, $context);
}

?>
```

You can wrap up as many arguments as you like in the context array, $op can be used to define related actions like the way the user module has op for insert, delete, update etc.

`$arg1` is passed by reference as the `$object` parameter to actions.

## Tell Drupal about your triggers by implementing `hook_hook_info`

This adds the triggers on the triggers admin page

```php
<?php
function mymodule_hook_info() {
  return array(
      'mymodule' => array(
        'mymodule' => array(
          'some_op' => array(
            'runs when' => t('Text to explain when the trigger runs'),
           ),
           'some_other_op' => array(
             'runs when' => t('more user text'),
           ),
         ),
       ),
   );
}

?>
```

## Now you can use the admin interface to run actions when your triggers fire.

See [Writing triggers (Drupal 6.x)](http://drupal.org/node/375833) for more details - I wrote this up as I found it helpful to approach the issue in reverse order to that page.
