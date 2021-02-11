---
layout: post
title: Aptitude Search
date: 2008-05-28T14:01:25+01:00
comments: true
tags:
  - linux
  - debian
  - ubuntu
---

The basic search is:

`aptitude search apache`

Returns all packages that match

To search only for the installed versions

`aptitude search ~iapache`

To search for the packages that aren't installed

`aptitude search \!\(~i\)apache2`

Search Term reference

http://algebraicthunk.net/~dburrows/projects/aptitude/doc/en/ch02s03s05.html
