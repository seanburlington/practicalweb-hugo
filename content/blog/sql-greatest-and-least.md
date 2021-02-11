---
layout: post
title: SQL Greatest and Least
date: 2009-07-21T13:31:39+01:00
comments: true
tags:
  - postgresql
  - mysql
  - sql
---

Most of the time I can get what I want out of SQL using the standard aggregate functions, but today I needed to find the latest timestamp from any one of three columns.

I achieved this using the GREATEST() function, it's not part of the SQL standard but is commonly available.

`GREATEST(<em>value</em> [<span class="OPTIONAL">, ...</span>])`

`LEAST(<em>value</em> [<span class="OPTIONAL">, ...</span>])`

The GREATEST and LEAST
functions select the largest or smallest value from a list of any
number of expressions.
