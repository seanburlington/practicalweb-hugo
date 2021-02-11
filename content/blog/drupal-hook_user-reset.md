---
layout: post
title: Drupal hook_user reset
date: 2010-03-29T15:05:40+01:00
comments: true
tags:
  - drupal
---

I need a user hook that sends password reset events.

I created a very simple module to do this - but it doesn't work.

I think this is because user_pass_reset() calls drupal_goto() after a login link is used - and that this bypasses my extra form handler.

and according to

http://www.advomatic.com/blogs/marco-carbone/drupal-privacy-configuring-your-site-to-work-without-cookies-for-anonymous-users

> form_alter on 'user_pass_reset' doesn't work reliably, due to how the one-time login form is implemented

```php
<?php

function userresethook_form_alter(&$form, &$form_state, $form_id){
  if ($form_id == 'user_pass_reset'){
    $form['#submit'][] = 'userresethook_submit';
  } else {
    return;
  }
}

//This doesn't get called!
function userresethook_submit($form, &$form_state){
  global $user;
  user_module_invoke('reset', $form, $user);
}

?>
```

This is a shame as this could be a useful hook and I prefer not to patch the user module (which is what I've done for the time being).

Am I missing something? Is my code wrong? Is there a better way...
