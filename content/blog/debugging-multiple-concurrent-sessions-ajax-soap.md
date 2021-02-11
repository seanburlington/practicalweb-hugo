---
layout: post
title: Debugging Multiple Concurrent Sessions (AJAX/SOAP)
date: 2008-03-03T09:06:42Z
comments: true
tags:
  - eclipse
  - best practice
  - ajax
---

I've recently been working with AJAX and SOAP which both result in multiple sessions running concurrently.

For example if you have an AJAX progress bar for a large file upload one session is uploading the file while a series of shorter sessions check on progress and update the bar.

How to track both parts of this cleanly has had me scratching my head a bit - but the solution is fiendishly simple.

It turns out that there is a buried configuration setting in Eclipse (my IDE of choice) which allows you to debug multiple sessions.

in Eclipse go to:

Window | Preferences ... | PHP | Debug | Installed Debuggers | XDebug | Configure

Then check the box that says 'Use Multisession'

Lo and Behold the debug pane now has a multisession manager and allows you to see what is happening on both sessions.

see also

http://dev.eclipse.org/newslists/news.eclipse.tools.pdt/msg01476.html
