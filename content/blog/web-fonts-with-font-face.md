---
layout: post
title: Web fonts with @font-face
date: 2009-07-17T13:47:34+01:00
comments: true
tags:
  - css
  - design
  - fonts
---

When the web first started everything was in Times New Roman, black on grey with few images.

Things have moved on a long way since then, but there are still very few fonts. I've worked on many sites that have tried to overcome this by various routes.

<!--more-->

- Creating an image of headline text in the desired font

  This can look good but offers poor accessibility and it's hard to update

- [SiFR](http://www.mikeindustries.com/blog/sifr/) - uses JavaScript and flash to add fonts

  It can work well - but performs badly if overused, and can cause problems with z-ordering on some systems

- [@font-face](http://www.w3.org/TR/css3-fonts/#the-font-face-rule) Part of the CSS standard which allows you to provide font files for download.

  @font-face has a great deal of potential as the end users browser automatically downloads the font definition and renders whatever font you specify without any plug-ins or even JavaScript required.

However, this is actually quite old technology - I tried to use it back in the days of Internet Explorer 5 and Netscape Navigator.

Then as now there were competing standards for downloadable font files.

At the time both browsers only offered a web specific font format which didn't look good enough to use.

However; Firefox 3.5 and Safari 4 now support regular TTF and OTF fonts and these look great.

There is still the problem that most good fonts are supplied under license - which prevents you providing them for download.

But with two major browsers providing a good implementation for standard font file we can hope that it won't be too much longer before the problem is solved.
