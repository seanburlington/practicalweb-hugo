---
layout: post
title: Drupal Wishlist
date: 2009-11-05T10:26:05Z
comments: true
tags:
  - drupal
  - testing
  - best practice
  - architecture
---

Drupal has a lot of great strengths and some weaknesses

The following are the key areas of Drupal that (as a programmer) I would like to see improved.

## Negative testing 

Drupal only seems to
test the positive path, that is that given the right inputs you get
the right results and apart from security nothing else matters.

The result of this is
that incorrect inputs result in silent failures that can be very hard
to debug.

By testing that
incorrect inputs also provide dependable results with clear error
messages bug fixing becomes much easier and development time can be
reduced.

Of course it isn't
possible top test for all possible bad inputs – but just catching
some of the likely errors can be very helpful.

## Database abstraction

If Drupal (and
contributed modules) could provide functions to manage their data,
thereby removing the need for developers to either access data
directly or work via the GUI – then many development tasks would
become easier.

This would have
particular benefit for the deployment of upgrades to large sites as
all the changes could be written into update hooks.

## Stronger encapsulation

I find it particularly
noticeable when writing “unit” tests for Drupal that the
encapsulation could be stronger. Pervasive use of globals, direct
database access, and static variables for caching make it very hard
to test Drupal at the unit level – most tests end up running at the
integration level which while still useful is much slower and harder
to integrate into the regular development cycle (code, test, repeat –
then commit).

## Upgrades with backwards compatibility

Major Drupal upgrades
are not compatible, and minor upgrades don't add features.

The biggest impact this
has had on me and other professional developers I know is that it
removes the main incentive to contribute – namely to fix problems
in Drupal projects currently in progress.

## Define hooks

[A hook is a PHP function that is named foo_bar()](http://api.drupal.org/api/group/hooks">)

Well I know that, and I
know how to use them and even create new ones – but I think a more
complete definition would help clarify the purpose of hooks and
perhaps more importantly better named hooks would provide the
developer with a better idea of when hooks are called.

I think that hooks
probably provide more than one service, some hooks are really event
handlers (hook_cron() hook_validate() ) others are a kind of
interface (hook_view(), hook_update(), hook_insert() etc).

If you think of
hook_form_alter() as an event handler rather than for what work is
typically done at that event you might rename it hook_form_build()
which might help developers learn when it is fired and also provide
hints as to other ways it might be used (eg you could use it to log
the number of times a form is displayed on a site).

## Separate the toolkit from the components

I love the way that
drush isn't a Drupal module, its independent of production code – I
think it would be great of more tools provided this ability.

With a
strong API it would even be possible to use just the API of something
like CCK and remove the GUI entirely from production – thus
removing one way that a client who demands the admin password can
break the site.

## Choose a target

Drupal
tries to be all things to everyone: but this isn't possible.

I
don't think you can have a product that runs on low end servers with
out of date versions of PHP, works the same on any database (even
SQLite) and still meets the needs of enterprise level teams.

Drupal
needs to pick a target and focus on that – otherwise other products
will come along and do a much better job for specific sectors of the
market.

It
seems like there is a [similar issue with the user interface](http://www.disambiguity.com/designing-for-the-wrong-target-audience/)

## Conclusion

Generally I'd like to see a much tighter Drupal with more focus on best practise and a clean API.

Whether that is what the rest of the Drupal community wants is another thing.
