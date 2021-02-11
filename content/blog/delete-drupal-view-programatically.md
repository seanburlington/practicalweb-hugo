---
layout: post
title: Delete Drupal View programatically
date: 2010-07-02T11:22:37+01:00
comments: true
tags:
  - drupal
  - api
---

Quick function to delete a view.

This is basically what the UI form submit does.

```php

function delete_view($name) {

	$view = views_ui_cache_load($name);
	$view->delete();
	views_object_cache_clear('view', $view->name);

}

```
