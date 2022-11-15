---
layout: post
title: ! "Number Crunching : Database vs OOP"
date: 2008-10-05T10:50:21+01:00
comments: true
tags:
  - testing
  - best practice
  - sql
  - oop
---

For the last few months I've been working on a project that is part website and part data processing.

In theory the website is the bulk of the project, but in practice processing the data has taken a disproportionate amount of resources.

Data exchange with another organisation is always tricky - and in this case we have incoming data that doesn't conform to specification, business rules that change, and a daily data import to run.

The code I've been working on has been through a couple of versions, and now I have in mind a third

<!--more-->

1. process data from file a line at a time, comparing each record with the database individually

2. load all data from file into a temporary table, apply all rules as SQL updates to the whole table - joined to other tables where comparisons are needed.

3. load all data from file into a temporary table, retrieving data joined with the comparison data - process in batches say 1000 lines at a time.

Version 1 was impossibly slow, and it was bad code we inherited so it had to go.

Version 2 is much faster, but as the business rules are documented per record and we're performing set based operations it has proved very hard to verify that the code matches the required logic.  It's also very hard to unit test as all the logic is performed in the database.

Version 3 probably won't get written now - as is the way of programming - you always learn how you'd do it next time.

I have one colleague in particular who thinks that the database should do the heavy lifting as that is what it is optimised for, and to an extent I agree. But the more I get into unit testing the more I want to write code that neatly packages up logic in a testable way.

It has also become apparent just how important it is to have code that follows business rules in a clear way. It's not enough that the output should be right. I recently handed this code to a very capable developer - he's normally so polite - but trying to reconcile a flowchart with a long series of SQL queries tested his patience.

In the end leaning so hard on the database has made the system much harder to read, test, change, and maintain.

I wonder if version 3 would be any slower anyway - it might even be faster. In fact version 3 could be run multithreaded - or split into multiple processes....
