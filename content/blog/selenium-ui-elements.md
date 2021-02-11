---
layout: post
title: ! "Selenium UI-Elements "
date: 2011-05-19T11:05:35+01:00
comments: true
tags:
  - drupal
  - testing
  - selenium
---

While playing around with selenium IDE I discovered a fantatsic tool that makes test (and results) more readable while making the suite of tests easier to adapt to layout changes.

What it does is to allow you to centrally define most of the xpath (and related) statements and give page elements meaningful names.

So instead of testing for some element like

`//form[@id='search-block-form']//input[@type='text'] `

You can test for

`ui=allPages::mainSearchField()`

Now - not only is this more readable but if the id of the search form changes during development you don't have to change it in every test case for the form - but only in the file that defines "mainSearchField".

You could centralise these definitions in code - but then the IDE would be of less help - and crucially the test results would contain xpath instead of the more semantic names.

I found the documentation a little hard to get my head around at first, but the basics are quite straightforward.

To keep things simple I'm going to focus on tests within the IDE but without going all-out to optimise this.

<h2>Getting a basic Test running</h2>

My Test case (written for www.defaqto.com) is

```html
<table cellpadding="1" cellspacing="1" border="1">
  <thead>
    <tr>
      <td rowspan="1" colspan="3">consumer-nav</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>open</td>
      <td>/home</td>
      <td></td>
    </tr>
    <tr>
      <td>assertElementPresent</td>
      <td>ui=allPages::mainLogo()</td>
      <td></td>
    </tr>
    <tr>
      <td>type</td>
      <td>ui=allPages::searchField()</td>
      <td>credit cards</td>
    </tr>
    <tr>
      <td>clickAndWait</td>
      <td>ui=allPages::searchButton()</td>
      <td></td>
    </tr>
  </tbody>
</table>
```

And the ui-elements are defined as

```javascript
var myMap = new UIMap();

myMap.addPageset({
  name: "allPages",
  description: "defaqto.com pages",
  pathRegexp: ".*",
});

myMap.addElement("allPages", {
  name: "mainLogo",
  description: "the defaqto logo visible on every page",
  locator: "logo",
});

myMap.addElement("allPages", {
  name: "searchField",
  description: "top search input",
  locator: "//form[@id='search-block-form']//input[@type='text']",
});

myMap.addElement("allPages", {
  name: "searchButton",
  description: "top search button",
  locator: "//form[@id='search-block-form']//input[@type='submit']",
});
```

To run this test install [selenium IDE](http://seleniumhq.org/download/)
in firefox (you may need the [add on compatibility reporter plugin](https://addons.mozilla.org/en-US/firefox/addon/add-on-compatibility-reporter/) to get this to work in Firefox 4).

Then open the IDE (in the tools menu)

In the IDE click the options menu and the sub-item options

Browse to the [javascript map file](/sites/default/files/defaqto-map.js.txt) for the Selenium core extensions (NB if you download mine rename it to remove the .txt extension)

Click OK

close and re-open the IDE to make it pick up the change

There is an "activate developer tools" checkbox on the options dialog which allows you to reload the map file when you edit it - but it doesn't seem to work until the file has been loaded once.

At this point selenium should know about the ui map and will auto-complete the terms.

Open the [test case](/sites/default/files/consumer-nav.html) (from the file menu)

Make sure the base url refers to http://www.defaqto.com/ if you want to run this test (although the search form elements should work on most drupal sites).

Run the test case.

## Documentation - the short version

The full docs http://ttwhy.org/code/ui-doc.html look daunting - but there are only a few key functions.

Every UI map file has to start by creating a new UIMap object.

`var myMap = new UIMap();`

This object has methods to add pagesets, elements and rollups.

You only _need_ one pageset and this can cover all pages.

```javascript
myMap.addPageset({
  name: "allPages",
  description: "all pages",
  pathRegexp: ".*",
});
```

You can add more pagesets - where each pageset represents a group of pages - for example defaqto could have a set of consumer pages and another set of adviser pages, this makes the tests more readable as you can tell really quickly that the element is one specific to a subset of pages. It also helps unclutter the IDE as the autocompleter has fewer options to offer once you have started typing a specific pageset.

But to get started one pageset will do.

Next you need to add element definitions.

```javascript
myMap.addElement("allPages", {
  name: "searchField",
  description: "top search input",
  locator: "//form[@id='search-block-form']//input[@type='text']",
});
```

All this does is map a name to an xpath locator - now the IDE will use this when you record and action of filling in this field, and you can type it in and it will auto-complete.

Crucially - if development causes the id of the form to change it will be really easy to fix the test cases.

Really this is all that is needed to get UI elements working, there is a lot more that it can do.

There are powerful ways to define pageset: manually managed array, regex,URL parameters, or even defining rules to detect the page content.

Each UI-element can take arguments (so one locator can find the nth element in a list for example) - it can also be used as the basis of finding related elements.

## Rollup Rules

I haven't played with this yet - but it looks really cool...

As well as the UIMap there is a RollupManager

```javascript
var manager = new RollupManager();

manager.addRollupRule({ ... });
manager.addRollupRule({ ... });
```

What this purports to do is to represent a sequence of steps that can be reused throughout test cases.

So you can centralise steps like logging in which may need to be used in many test cases.

## Thanks

Thanks to Haw-Bin Chai http://ttwhy.org/home/blog/category/selenium/ for this functionality and to Mahesh Narayanan for this post
http://functionaltestautomation.blogspot.com/2009/09/ui-elements-all-about-it.html

Thanks also to my client [Defaqto Ltd](http://www.defaqto.com/) for supporting not only their team in adopting best practices but also encouraging posts like this to contribute back to the wider community.
