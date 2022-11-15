---
layout: post
title: Programatically Delete a content type in Drupal
date: 2011-05-05T17:34:56+01:00
comments: true
tags:
  - drupal
  - snippet
---

```php
<?php

$result = db_query("SELECT nid FROM node where type='mytype'");
while ($row = db_fetch_object($result)) {
    node_delete($row->nid);
}
node_type_delete('mytype');
?>
```

<!--more-->
[2022: This is very old] 