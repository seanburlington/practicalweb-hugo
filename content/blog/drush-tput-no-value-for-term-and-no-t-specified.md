---
layout: post
title: 'Drush "tput: No value for $TERM and no -T specified"'
date: 2010-02-18T11:23:34Z
comments: true
tags:
  - drupal
  - linux
  - drush
  - bash
---

The drush script which provides command line access to drupal functionality emits an error message when run as a cron job

`tput: No value for $TERM and no -T specified`

<!--more-->

```bash
# If it is not exported determine and export the number of columns.
if [ -z $COLUMNS ]; then
  export COLUMNS=$(tput cols)
fi
```

I presume drush uses this information to calculate layout of output.

However when running as a cron job COLUMNS is not set and tput gives the above error.

To resolve this specify a COLUMNS value in your cron job, setting an appropriate size for viewing in email

cron now runs the following for me.

```bash
#!/bin/bash

cd /var/www/mysite/public_html

COLUMNS=80 /home/me/bin/drush cron
```
