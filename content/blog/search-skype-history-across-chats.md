---
layout: post
title: Search skype history across chats
date: 2013-10-14T17:27:19+01:00
comments: true
tags:
  - skype
---

I find a lot of clients use skype

For me the biggest frustration is the limited search

But it turns out the data is stored using sqlite - and so you can search using sql directly on the sqlite db files.

<!--more-->

https://gist.github.com/seanburlington/740d136e58d8b87d057f

```bash
#!/bin/bash

export username=skype.name
sqlite3 -column ~/.Skype/$username/main.db \
"SELECT displayname, from_dispname, datetime(Messages.timestamp, 'unixepoch') as date, body_xml
             FROM Messages, Conversations
             WHERE Conversations.id=Messages.convo_id and body_xml like '%$searchterm%'
             ORDER BY Messages.timestamp;"


```

or for all your chats from a given day

https://gist.github.com/seanburlington/85e282537f6f2f631414

```bash
export username=skype.name
export thedate=$(date +%Y-%m-%d)
sqlite3 ~/.Skype/${username}/main.db \
"SELECT displayname, datetime(Messages.timestamp, 'unixepoch') as date, body_xml
           FROM Messages, Conversations
           WHERE Conversations.id=Messages.convo_id and date(Messages.timestamp, 'unixepoch') == '${thedate}' and author='${username}'
           ORDER BY Messages.timestamp;"
```
