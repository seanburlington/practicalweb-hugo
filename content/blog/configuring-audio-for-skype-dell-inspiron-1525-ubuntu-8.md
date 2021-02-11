---
layout: post
title: Configuring Audio for Skype Dell Inspiron 1525 Ubuntu 8
date: 2008-06-24 09:19:03+01:00
comments: true
tags:
  - linux
  - ubuntu
---

> This is a very old blog post which has lost

The audio controls for the Dell hardware are less than obvious; I didn't even notice that there is a built in microphone.

Below are screen grabs of the settings that work for me - giving audio at the right levels for Skype calls.

On the settings tab; ensure "capture" is enabled, "digital" seems to control the mic level - I found midway to be about right - higher levels caused distortion.

<!--more-->

MISSING IMAGE

Output: "Master" is the main volume control (which is the level affected by the inbuilt volume buttons).

MISSING IMAGE

On the settings tab ensure 'analog loopback' is unchecked or you just get the microphone fed back into your headphones without being picked up by skype. This is the setting I messed at first.

Set "Input Source" to "front Mic" if you have an external microphone, or "Mic" to use the inbuilt one.

MISSING IMAGE

There seems to be a Ubuntu bug which is displaying some settings multiple times (like input source). I just used the first one and ignored the others.
