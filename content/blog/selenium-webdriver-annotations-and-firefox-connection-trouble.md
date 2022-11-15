---
layout: post
title: Selenium WebDriver annotations and firefox connection trouble
date: 2012-05-02T12:36:25+01:00
comments: true
tags:
  - selenium
  - webdriver
  - maven
---

I needed to run some selenium tests written by a Java team using maven

I ran into a couple of errors

**Annotations are not supported in -source 1.3**

<!--more-->

This error is because by default maven compiles code to be compatible with an older version of Java

To fix I had to add the following to then `pom.xml` file

```xml
<groupId>org.apache.maven.plugins</groupId>
<artifactId>maven-compiler-plugin</artifactId>
<version>2.3.2</version>
<configuration>
<source>1.6</source>
<target>1.6</target></configuration>
</plugin>
```

This allows the use of more recent code constructs

Next I had a firefox error

**org.openqa.selenium.firefox.NotConnectedException: Unable to connect to host 127.0.0.1 on port 7055 after 45000 ms. Firefox console output:**

It seems that maven was targeting an older version of firefox than I am using, this time I changed the selenium version number in the config as below

```xml
             <dependency>
                 <groupId>org.seleniumhq.selenium</groupId>
                 <artifactId>selenium-java</artifactId>
-                <version>2.14.0</version>
+                <version>2.19.0</version>
             </dependency> 

```
