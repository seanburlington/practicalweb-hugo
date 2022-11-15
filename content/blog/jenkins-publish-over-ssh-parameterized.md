---
layout: post
title: Jenkins publish over ssh - parameterized
date: 2013-04-18T18:03:11+01:00
comments: true
tags:
  - jenkins
---

To have a jenkins job which acts on a remote server via ssh - and has a parameter to choose which server(s) to use.

<!--more-->

1. check _This build is parameterized_
2. Make the parameter name something like TARGET_SERVER
3. add build step _Send files or execute commands over SSH_
4. Add server
5. In server details click _advanced_
6. add a value for _Label_
7. at the end of the ssh section check _Parameterized publishing_
8. specify the _Parameter name_ from earlier (TARGET_SERVER)
   Now when you run the job supply a value for the TARGET_SERVER parameter that can be a regex, the job will run the ssh sections on any servers that have a matching label.
