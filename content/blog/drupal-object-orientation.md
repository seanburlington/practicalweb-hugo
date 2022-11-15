---
layout: post
title: Drupal Object Orientation
date: 2008-07-20T14:53:18+01:00
comments: true
tags:
  - php
  - eclipse
  - drupal
  - enterprise
---

One of the surprising things about Drupal is that it doesn't use object oriented coding.

There's a good page in the Drupal documentation about this

http://api.drupal.org/api/file/developer/topics/oop.html

It makes a good case for the design of Drupal, and goes a long way to explain why Drupal feels more OO than the code looks at first glance.

<!--more-->

There has been discussion on the mailing list

Endless debate:  
http://lists.drupal.org/pipermail/development/2006-July/thread.html#17264

Objects vs Arrays:  
http://lists.drupal.org/pipermail/development/2007-January/021746.html

Why use the object notation:  
http://lists.drupal.org/pipermail/development/2005-July/thread.html#7137

A lot of that discussion boils down to personal preference - but one of the key issues seems to be that OO support in PHP4 is poor.

As an enterprise CMS I don't believe that Drupal has had any business considering PHP4 for a long time; I'm glad that PHP5 will be required for Drupal 7 - but that's still a long way off.

Another oft-quoted argument is that Object performance is worse than array equivalents: this this performance difference seems marginal at best - reducing the number of queries per page is likely to make a far bigger difference. CPU cycles are way cheaper than programmer hours  - and in any case better structures lead to more efficient programming which ends up producing faster code.

There's a great Post from merlinofchaos on how Drupal might look  
http://www.angrydonuts.com/what_if_fapi_were_oo

To my mind one of the biggest reasons to use OO constructs would be to define structure in a way that would generate errors when mistakes are made. If you look at the http://api.drupal.org/api/file/developer/topics/forms_api_reference.html/5">form api page you will see endless comments like "Property names without # signs causes havoc." this is a direct result of using a complex array to build forms - if objects were used it would be much easier to generate errors when the wrong attribute name was used. Drupal has much to strong a tendency to be silent about errors - making debugging much harder than it needs to be.

WebChick wrote a great post about making Drupal E_ALL compliant  
http://drupal.org/node/99625

Using well defined objects would aid debugging in exactly the same way.

But for me the biggest productivity gain of a move to Objects would be auto-completion.

I use the Eclipse IDE for development and find auto-completion invaluable (along with the pop-up documentation and "open declaration"). To work this requires that the IDE be able to determine something about the variable in question. The IDE knows the allowed property names and methods of variables when they are a defined object type - but if all you know is that a function returns an array - none of this help is available.

The above argument doesn't even touch on the benefits of encapsulation, code re-use, and so on that have revolutionised software development. Even without full-on adoption of OO methodology - just adopting object structures over array structure would provide a huge boost in productivity.
