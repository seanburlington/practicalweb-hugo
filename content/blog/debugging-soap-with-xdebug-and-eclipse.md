---
layout: post
title: Debugging SOAP with Xdebug and Eclipse
date: 2010-10-14T10:42:14+01:00
comments: true
tags:
- php
- eclipse
- xdebug
- soap
---
It's been a while since I've worked on a project which is providing as well as consuming web services.

In this case I need to debug incoming requests that are not initiated from with the browser (I'm using <a href="http://www.soapui.org/">soapui</a> as a test tool).

In order to allow Eclipse to pick up xdebug responses triggered by requests from soapui I just needed to


<!--more-->

 * start a debuging session within eclipse as normal
 * ensure that the query string ?XDEBUG_SESSION_START=ECLIPSE_DBGP is appended to all requests by editing the WSDL file so that the address looks like
```xml
<soap:address location="http://dev.example.com/soap_server.php?XDEBUG_SESSION_START=ECLIPSE_DBGP"/>
```
 * make requests via soapui


Now eclipse is picking up the soap requests and I can step through as normal (some tools apply a timeout which can be a nuisance while debugging - I haven't been using soapui long enough yet to see if that's the case here)
