---
layout: post
title: Drupal and TinyMCE
date: 2009-07-07T22:00:01+01:00
comments: true
tags:
- drupal
- javascript
- tinymce
- jquery
---

I've been working on a Drupal project to build a CMS for the production and management of very specific content.


The emphasis is all on the  backend system, with tight field size limits (character count including markup) and restricted input (specified tags only).


Becuase of this I needed to use TinyMCE fully - restricting the  valid_elements set, and adding event handlers for paste, and keyup.


I also had to do this in a moderately deeply nested form.


While I tried quite hard to do this within the Drupal WYSIWYG module  http://drupal.org/node/488034 it became clear that the project developer and I had incompatible goals. He wanted all features to be available only where they work on all Rich Text Editors, I wanted to use a feature only available in one.


Initially I tried just patching the module, but in the end I just couldn't get it working with multiple tinyMCE configurations in one form. This is supposed to be possible but the documentation is limited

 * http://drupal.org/node/358316
 * http://api.drupal.org/api/function/filter_form/6
 * http://groups.drupal.org/node/8911


Part of the problem is that WYSIWYG works by detecting input filters which requires you to use them (I didn't want to) and using filters means you get 'help text' - using multiple filters means users get to choose which one. 


You can theme some of this cruft away - but then where's the benefit   of the easy to use GUI?


So I fell back to using TinyMCE directly, found out there is a nice jquery plugin http://tinymce.moxiecode.com/examples/example_23.php


And got my form up and running exactly as I wanted it in short order.


All I had to do was assign a class to the fields I wanted to be rich text editable,  create my settings, and adapt an existing character counter.


The settings look like


```javascript

var single = {
    valid_elements                    : 'b,i',
    theme_advanced_buttons1           : "bold,italic,cleanup",
    theme_advanced_buttons2           : "",
    theme_advanced_buttons3           : "",
    theme_advanced_statusbar_location : "bottom",
    theme_advanced_toolbar_location   : "top",
    theme                             : "advanced",
    theme_advanced_resizing           : true,
    plugins                           : "maxlength,safari",
};

```

 TinyMCE is enabled by the lines

```javascript

 $().ready(function() {
        $('textarea.mceSingle').tinymce(single);
        $('textarea.mceEditor').tinymce(welcome);
});

```

No filters, no cruft in the user interface, and it was quicker to develop!



