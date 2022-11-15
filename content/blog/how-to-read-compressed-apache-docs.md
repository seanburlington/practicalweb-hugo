---
layout: post
title: ! "How to read compressed Apache docs "
date: 2008-10-18T11:26:38+01:00
comments: true
tags:
  - documentation
  - linux
  - debian
  - ubuntu
---

One of the great things about Debian/Ubuntu is the consistency with which system documentation is placed in /usr/share/doc/

Assuming you have a web server installed this documentation is then available at http://localhost/doc/

<!--more-->

But to keep filesize down - many files are compressed and have to be decompressed before you can read them.

The browser can actually do that compression on the fly - if it receives the right headers - what it needs to be told is that the content is compressed plain text.

To achieve this add the following lines to your default apache config for the docs directory (there should already be a docs section)

```apache
<Directory "/usr/share/doc/">
AddEncoding x-gzip gz tgz
AddType text/plain .gz
</Direcory>
```
