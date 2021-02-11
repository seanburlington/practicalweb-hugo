---
layout: post
title: When to Choose Drupal
date: 2009-11-03T18:52:10Z
comments: true
tags:
  - drupal
  - cms
  - framework
---

Drupal is a very flexible CMS which can be extended to provide the functionality needed for may different types of website.

I've worked on a few projects where I was brought in for my Drupal expertise, but in the end felt that Drupal wasn't a good solution in these particular circumstances. So I've been pondering what sorts of projects is Drupal best suited to.

I'm not thinking about small brochureware websites that might be best managed using Wordpress, Joomla or the like as almost all my experience is of larger projects where the alternatives are frameworks such as Symfony, Rails, Struts etc – or pure custom code.

I'm know it's possible to run a successful Drupal project that doesn't have all the good points and does have some bad points from the lists below – I've done it.

But if anyone has successfully delivered a regularly upgraded, high traffic, fully tested web application with inflexible requirements using a large team of OO programmers with little prior Drupal experience – well I'd love to hear about it.

## Drupal Positives

- Small team
- Drupal experience
- There is a maintenance plan
- A single release
- Flexible specifications
- Content Oriented
- Greenfield project
- Moderate traffic

## Drupal Negatives

- Large team
- Minimal Drupal experience
- OO skills
- No/low maintenance budget
- Regular upgrade cycle
- Inflexible requirements
- Web Application
- AJAX heavy
- High traffic
- Testing a high priority
- Legacy systems integration

## Team Size

I spent a year working on a Drupal project that had about 15 developers, plus test team, designers, project management etc.

It's possible, but with this size team we ran into several problems.

In order to compose modules, content types, views, blocks, menus etc to build useful functionality the developer effectively works in the database a lot of the time. With small team it is possible to share a database so that work done there can be promoted directly to live just by selecting the required tables, with a large team sharing the database would lead to too much downtime (introduce a bad configuration and you have 14 people waiting for you to fix it).

Databases aren't easy to version control – especially when you need to take into account auto increment fields so you don't get conflicting IDs when merging work from several developers.

Drupal's install and update hooks can be useful but they are targeted more at distribution than team synchronisation.

Generally we fond that the Drupal hook system provides power without restraint – making it all too easy for a module to implement something like hook_form_alter() in a way that subtly breaks the behavior of an unrelated module elsewhere.

## Drupal vs OO experience

I've worked with some developers that love Drupal some that didn't know it, and others that hate it. It's all to easy when selecting a new technology to get carried away by the possibilities, but don't forget technologies don't build websites – people do.

“_For the overwhelming majority of the bankrupt projects we studied, there was not a single technological issue to explain the failure.” _[Peopleware](/review/peopleware)

If your team hates Drupal and loves OO then be very careful about selecting it for your project, conversely if you're Drupal shop full of experienced Drupal developers you can probably get away with using Drupal when it's outrageously unsuited to the task.

## Maintenance

Any website complex enough to consider using Drupal is going to need some maintenance, but I am surprised by the frequency of Drupal updates that need to be applied to keep the site secure.

I have written applications without the benefit of a framework or CMS that after the first month or two neither needed nor received any development work for a period of years. I worked for a long time on an application that has now run for seven years – during which time you might see three or four incompatible Drupal versions released.

Security releases are in general a good thing, and Drupal support is not short term so this may not be a major concern for many projects – but Drupal is not a “fire and forget” solution.

## Release Frequency

Deployment is well accepted as being one of Drupal's weaknesses

"_Deployment of code, content, and configuration changes continue to be one of the big challenges in Drupal_" [Kieran Lal](http://association.drupal.org/Building-redesign-community-infrastructure-Administrators-wanted)

If your project is something you build, test, release, and finish: then deployment isn't a problem.

If you need to apply verified patches to fix bugs, while rolling out major upgrades every couple of months: I can tell you from bitter experience that Drupal can be a challenge.

## Flexible Specifications

Drupal can help you develop functionality very quickly by using existing modules. But these modules will already have an interface and a certain way of doing things; if you can be flexible in the interpretation of requirements then Drupal can be great. However if your project has to meet specific client expectations and Drupal doesn't work quite that way you may find yourself working very hard to alter Drupal to fit.

See also[ http://www.sunlightlabs.com/blog/2009/content-management-systems-just-dont-work/](http://www.sunlightlabs.com/blog/2009/content-management-systems-just-dont-work/)

## Content Site or Web Application

Drupal is a very flexible CMS, and you can build other things with it, but I don't think it qualifies as a framework and so I wouldn't use it in that way to create an application.

Drupal has a very thin database layer, it doesn't separate the MVC components very well (theme, menu and model functions all in the same module), and there are many holes in the Drupal API.

On the other hand Drupal has a lot of content oriented tools so if your project needs these it may well save a lot of development time.

## Greenfield or Legacy Integration

Drupal requires a certain database structure, with even less flexibility if you use CCK if you already have a database structure which you can't change it would be difficult to use Drupal. You can integrate existing databases with Drupal but everyone I've spoken to who has done this has ended up writing an import routine that converts existing data into Drupal nodes, even if this involves loading and submitting thousands of virtual Drupal forms.

## AJAX

I've just finished a project which made heavy use of AJAX, and I was surprised to find that Drupal did very little to facilitate this and that I had to [work around some problems](http://www.drupaler.co.uk/blog/naming-form-items-drupal/429).

Sure you can do AJAX in Drupal – but if you're going to be doing a lot of AJAX you might want to use a framework that targets this.

## Traffic levels

Drupal is resource intensive, CCK and Views can hit the database pretty hard, Drupal's hook system gives you flexibility but you pay for this by allowing each module to act separately on the same event when a single action might be more efficient.

If you throw enough hardware at Drupal you can make it scale massively as Comic Relief does to notable effect – but they do have to do a lot of work synchronising data and assets to make this work.

For sites with a normal amount of traffic Drupal will be just fine anyway.

## Testing

I've used Drupal's test framework where I can and it's clearly been important in the development of Drupal 7 – but I don't see it being used by developers day to day. I think this is because Drupal isn't very test friendly. Any function may use the database at any point, functions cache data internally, global variables are used – tests are hard to isolate and run slowly.

For many websites rigorous testing isn't a priority – but if it is there many frameworks offer strong support for testing throughout development which may be helpful.

## Conclusion

I hope people find these thoughts useful, they are only intended as pointers based on my experience.

Many Drupal projects will succeed which have some of the bad points listed above, just as other projects which could be very good candidates for Drupal will succeed even if built using other tools.

But if anyone has heard of Drupal success stories that have none of my good points and all of the bad ones – please do let me know about it.
