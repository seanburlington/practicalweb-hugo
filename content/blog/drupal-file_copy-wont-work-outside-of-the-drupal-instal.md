---
layout: post
title: Drupal file_copy won't work outside of the Drupal install
date: 2008-11-11T20:52:04Z
comments: true
tags:
  - php
  - drupal
---

`The selected file could not be uploaded, because the destination is not properly configured`

This "feature" has bitten me before. It's one of those annoying Drupal things which would be fine if the error message wasn't so misleading.

What's happening is that `file_copy()` calls `file_create_path()`

<!--more-->

<?php
function file_copy(&$source, $dest = 0, $replace = FILE_EXISTS_RENAME) {
  $dest = file_create_path($dest);
?>

While `file_copy()` doesn't declare that it only works in the Drupal folders - `file_create_path()` is clear about this.

```php
<?php

/**
 * Make sure the destination is a complete path and resides in the file system
 * directory, if it is not prepend the file system directory.
 *
 * @param $dest A string containing the path to verify. If this value is
 *   omitted, Drupal's 'files' directory will be used.
 * @return A string containing the path to file, with file system directory
 *   appended if necessary, or FALSE if the path is invalid (i.e. outside the
 *   configured 'files' or temp directories).
 */
function file_create_path($dest = 0) {

?>
```

I need to copy files outside of the DocumentRoot to keep them private

Yes I could put them in the DocumentRoot and restrict access to the folder but that is just perverse (and easy to get wrong).

So I need to avoid these functions.
