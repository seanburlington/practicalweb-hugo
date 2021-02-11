---
layout: post
title: Keep Your Drupal Theme Simple
date: 2008-07-12T12:29:01+01:00
comments: true
tags:
  - drupal
  - css
---

When creating a Drupal theme it is tempting to start with one of the existing themes (Zen and Garland are often used) but I would argue against this approach.

If you start from another theme it feels good at the beginning; after all you start from a position where your site looks good. But the more customisations you make, the more you find that the old theme just adds complexity to your existing theme.

The way Drupal works is that each module can add it's own CSS: so tabs, menu trees, filters and so on all come with some sensible styling by default. If you want it to look different you not only have to create the CSS to make it look how you want - you have to make sure this overrides the default rules.

So CSS in Drupal isn't simple - don't add to the complexity more than you need to.

<!--more-->

Start with a blank theme, make only the changes you need.

That way you understand more of the CSS your site uses, changes are much easier to make, and bugs are less likely.

This site is an example of that approach, the main stylesheet is less than 300 lines of code. IE6 specific code, and print style are only another 40 lines each.

More complex themes benefit even more from initial simplicity, the complexity can then be built up systematically without fighting another designers plans.
