---
layout: post
title: Why I don't like Gitflow
date: 2012-08-01T14:02:39+01:00
comments: true
tags:
  - git
  - version control
  - gitflow
---

I've been looking into [Gitflow](https://github.com/nvie/gitflow/) recently, it's an interesting set of scripts to facilitate [a successful git branching model](http://nvie.com/posts/a-successful-git-branching-model/) which some of the people I work with rave about.

In the end I've decided I don't like the tool or the model, though both are interesting.

<!--more-->

I think this is because I'm used to working in fairly large teams where we may have some people working on one release and others working on the next, in this situation I want release branches that are fairly long lived, and to create topic branches from them.

In fact in one project we dropped the master branch altogether and just used a series or release branches, always merging the older release branches into the newer (further from launch) ones.

The other main reason is that Gitflow hides some of the mechanics of git in a way that seems to me to hinder peoples understanding of what they are doing, it's a shame it doesn't output the git commands it uses - that would allow people to use it to get started then move on later if they want.

The commands also seem very slow to me which is odd when you are used to git being fast.

Documentation on Gitflow seems sparse, with some commands incomplete (git flow support \* , Gitflow feature checkout)

The best I could find is the source, and particularly the "summary" bits

[https://github.com/nvie/gitflow/blob/develop/git-flow-release#L177](https://github.com/nvie/gitflow/blob/develop/git-flow-release#L177)

The project wiki does have some additional info on command line options

[https://github.com/nvie/gitflow/wiki/Command-Line-Arguments](https://github.com/nvie/gitflow/wiki/Command-Line-Arguments)
