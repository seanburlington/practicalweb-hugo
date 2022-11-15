---
layout: post
title: How to manually unpack a .deb file
date: 2008-06-08T19:00:47+01:00
comments : true
tags:
- linux
- packaging
---
Sometimes you want to look at the contents of a package without installing it.

Sometimes you want to compare your installed version with the original package.

Run the following commands

<!--more-->

```bash
mkdir ~/temp
dpkg -x somepackage.deb ~/temp/
```

To unpack (without installing) in a temp directory.
