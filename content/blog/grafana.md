---
layout: post
title: "Grafana"
date: 2014-11-19 10:07:55 +0000
comments: true
tags:
  - grafana
  - graphite
  - graphing
  - devops
  - metrics
---

I've been playing with some new toys.

What motivated me was a desire to be better able to interpret load test data and performance metrics.

I love graphs, for me the visualisation they provide allows me to recognise patterns and figure out cause/effects massively faster than any other way.

In the past I've mainly relied on Munin which is very easy to setup, and I've even customised graphs. My most successful case was when two servers in a pool of four kept falling down, by graphing apache hits per second and severer load for all for servers on the same page - it provided convincing proof that the two servers which fell down did so under no extra load and at the exact same moment. It later turned out these two were VMs on the same host OS which was having previously unnoticed problems.

This visualisation transformed a conversation from one of what could or couldn't be wrong to acceptance and how to fix it.

But with Munin I had to define the graph and then collect the data - I had to wait for another outage.

I wanted to be able to compose graphs on the fly to test hypotheses with existing data - grab the data now and define the graphs to visualise what I want to see after the fact.

Enter [Grafana](http://play.grafana.org/) I just love this tool, it allows me to compose graphs entirely on the fly, mixing and matching any data I want on the same graph, or multiple graphs on the same page.

With the [timeshift](http://graphite.readthedocs.org/en/latest/functions.html#graphite.render.functions.timeShift) function I can even put say this weeks and last weeks data on the same graph for easy comparison.

I hope to work on some screenshots and maybe screencaps - the tool is so interactive it's hard to explain - for now go an play with it.

Grafana works by calling the json API of graphite-web, one thing that threw me at first was the [initial config example](http://grafana.org/docs/#graphite-&-elasticsearch-setup-example)

```json
datasources: {
  graphite: {
    type: 'graphite',
    url: "http://my.graphite.server.com:8080",
  },
},
```

I wasn't sure which server component I was meant to be connecting to on 8080, this is just the regular graphite-web service from apache - in my case on port 80.

It's also worth noting that [https://github.com/graphite-project/graphite-web/issues/223](graphite cannot exist in a subdirctory) at least not for the version I am running.
