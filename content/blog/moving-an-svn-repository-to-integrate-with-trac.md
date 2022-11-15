---
layout: post
title: Moving an svn repository to integrate with trac
date: 2010-02-02T09:29:11Z
comments: true
tags:
  - ubuntu
  - svn
  - trac
---

I just started on a project that was using trac and subversion but they weren't integrated. I love the cross referncing trac provides. It can really help explain changesets and show how an issue was resolved.

The steps to add subversion to trac are

<!--more-->

- Stop people using the old repository
- copy the repository files from one server to the other I used tar and scp
- edit trac.ini to add the location of the respository  
  Trac and svn must be on the same server
- run trac-admin resync  
  This imports all the svn history.

I enabled access to subversion via apache SSL while I could get access via the browser checking out code with different tools gave the follwoing errors

```
svn: OPTIONS of 'https://195.99.1.93/svn': 200 OK

svn: PROPFIND of '/svn': 405 Method Not Allowed

svn: Server sent unexpected return value (405 Method Not Allowed) in response to PROPFIND request for '/svn'
```

Thanks to http://techpulp.com/2009/01/webdav-405-method-not-allowed-in-porpfind/ I found out that my problem was an extraneous trailing slash in my Apache config!

I then ran svn relocate (right click on the repository using eclipse in the subversion perspective).

I moved Trac to SSL for good measure - changing the location on the task repository in eclipse was straightforward.

And as a finishing touch I customised Trac by adding a project logo - it goes in `trac/htdocs/mylogo.png` and is referenced in `trac.ini` as `site/mylogo.png` - I've failed this step before but actually read the docs this time.
