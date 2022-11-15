---
layout: post
title: Drupal files directory  permissions for continuous integration
date: 2011-05-31T11:45:36+01:00
comments: true
tags:
  - drupal
  - linux
  - hudson
  - jenkins
  - security
  - jenkins
---

Historical note : Hudson is what Jenkins was called a long time ago.

I want the drupal user uploaded files to be manageable by both apache and a non-root user

In my case I'm using hudson to rebuild the site with data and "files" from live periodically.

<!--more-->

So I have added the apache group to the hudson user

```
/usr/sbin/usermod -G hudson,apache hudson
/etc/init.d/hudson restart
```

and set the umask for apache so that files are created group writebale

For Redhat

```
echo "umask 002" >> /etc/sysconfig/httpd
/etc/init.d/httpd restart
```

For Debian/Ubuntu

```
echo "umask 002" >> /etc/apache2/envvars
/etc/init.d/httpd restart
```

NB debian based systems use the group www-data for apache

In my build script I can delete my dev files and copy the ones from live - making sure the group for the files is set to apache.

```
rm -Rf files
cp -R /tmp/backup/files/ ./
chgrp -R apache files
find files/ -type f -exec chmod 664 '{}' ';'
find files/ -type d -exec chmod 775 '{}' ';'
```

Now apache can write the files I have created, and I can create the files apache has created - <b>and</b> they are not world writeable.

see also http://drupal.org/node/244924

## Update - drush

I had a cron job running drush as a different user - this created cached files which hudson couldn't delete.

Now I am running the drush cron via hudson and making sure all the 'files' directory stuff is owned correctly afterwards

NB non-root users don't seem to be able to chgrp files that they don't own

so after running cron I make sure any files created by hudson are chgrp'd

```
find files -user hudson -exec chgrp apache {} \;
```

A simple chgrp -R caused permission denied errors on those files not owned by hudson - even though they were already group apache so wouldn't have been affected.
