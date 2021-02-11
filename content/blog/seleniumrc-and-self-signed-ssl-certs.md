---
layout: post
title: SeleniumRC and self signed SSL certs
date: 2011-05-13T17:42:30+01:00
comments: true
tags:
  - selenium
---

One of the nice things about selenium tests is that you get a clean browser session each time (so no problems with cookies etc left over from earlier)

But the way this is achieved is by using a new profile each time and this profile doesn't know about your SSL exceptions for avoiding error messages with those self-signed certs on the dev server.

This causes access to SSL via selenium to fail.

You can get around this by creating a custom firefox profile

Create a new profile with

```
firefox -no-remote -P
```

Follow the stpes to creaet a profile (and call it "selenium")

Visit your site and accept the SSL cert - set the start page to be blank and close the browser.

Now find the profile directory something like

```
~/.mozilla/firefox/8h1w7nkh.selenium
```

Run the selenium server like

```
java -jar selenium-server-standalone-2.0b3.jar -firefoxProfileTemplate ~/.mozilla/firefox/8h1w7nkh.selenium/
```

and it should work.

I found it a bit annoying that I was seeing warnings about extra plugins that selenium installs. So I copied these to my profile

```
#extract them from the jar file
jar xf selenium-server-standalone-2.0b3
#copy to my profile
cp -R customProfileDirCUSTFFCHROME/extensions ~/.mozilla/firefox/8h1w7nkh.selenium/extensions
# start the profile manually to see the warnings once
firefox -no-remote -P selenium
```

Now I don't see those warnings any more.

As far as I can see the above only works for firefox, I think the best solution is to just buy a real SSL certificate - they are much cheaper than developer time. But if office politics makes this difficult at least this profile means you can get started.
