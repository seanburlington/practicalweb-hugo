---
layout: post
title: Drupal development mail testing
date: 2008-02-20T20:39:18Z
comments: true
tags:
  - drupal
  - testing
---

One of the problems I have encountered while developing for Drupal on a laptop is how to test the sending of emails.

I've recently come across two solutions.

<!--more-->

## Devel Module

This helpful module includes a mail wrapper function which directs all mail to the Drupal logs, perfect for testing volume mail sending or just for getting a password reset link.

http://drupal.org/project/devel

## SSH tunnels

This is probably a more specialist solution - but I've recently been using an SSH tunnel to allow me to send and receive email through a firewall. As a bonus this means that all mail on localhost port 25 is redirected to my mailserver and PHP mail functions Just Work

ssh example.com -L 25:localhost:25
