---
layout: post
title: How to create your own Wayback Machine
date: 2005-02-23T16:08:05Z
comments: true
tags:
  - linux
  - apache
---

I’ve long been impressed with the [wayback machine](http://www.archive.org/) and found it very useful to find things that have disappeared from the rest of the Internet.

I use [cvs](http://www.cvshome.org/) a lot in software
development and find it a real life saver to be able to restore any
file I have been working on at any point in it’s history. This really
helps me to find out when and why things went wrong, saving me from
making the same mistakes again.

What I wanted was a system that would give me some of this functionality - but for file structures outside of my direct control.

Here is my recipe:

Install [pdumpfs](http://namazu.org/%7Esatoru/pdumpfs/) (you are running Linux/Unix aren’t you?)

pdumpfs is a simple daily backup system written in Ruby (ruby(1)),
which is similar to Plan9’s dumpfs that preserves every daily snapshot.

Back up your home directory with pdumpfs, and you can retrieve any past day’s snapshot of any file.

pdumpfs constructs each day’s snapshot in the directory named YYYY/MM/DD under the destination directory. All
source files are copied to the snapshot directory for the first time, and on and after the second time, pdumpfs
copies only updated or newly created files and stores unchanged files as hard links to the files of the previous
day’s snapshot to save disk space.

Set up a cron job to run pdumpfs /sourcedir /backupdir

That gives you the archive to work with - I wanted to back up a website be able to access each days archive directly.
To do this I used Apache’s VirtualDocumentRoot directive together with
a wildcard DNS record so that I access any days archive from a url like
http://20050223.wayback/ (where the number is the date as YYYYMMDD).
My Apache config looks like:

```apache
NameVirtualHost *:80
<VirtualHost *:80>
ServerName *.wayback
UseCanonicalName Off
# this log format can be split per-virtual-host based on the first field
LogFormat "%V %h %l %u %t "%r" %s %b" vcommon
CustomLog /var/log/apache2/wayback-access.log vcommon
VirtualDocumentRoot /var/www/wayback/%1.1%1.2%1.3%1.4/%1.5%1.6/%1.7%1.8/origdirname
</VirtualHost>
```

My wildcard DNS entry is just
\*.wayback IN A 127.0.0.1
In the zone file for my local domain (if it wasn’t my local domain I’d
need to specify the fully qualified name of the server in the apache
config.

Altogether this creates an archive where each days version of the
website is under /somedir/YYYY/MM/DD/website/, the wildcard DNS means
that any request to YYYYMMDD.wayback is sent to the right server,
wildcard server name will always match, the virtual document root reads
the first part of the server name and interprets it in the form needed
to get the right path. Hey presto we’ve gone back in time and see the
website as it was then!

More about Apache’s [Directory Name Interpolation](http://httpd.apache.org/docs-2.0/mod/mod_vhost_alias.html#interpol)
, [Dynamically configured mass virtual hosting](http://httpd.apache.org/docs-2.0/vhosts/mass.html),
and [Custom Log Formats](http://httpd.apache.org/docs-2.0/mod/mod_log_config.html#formats).
