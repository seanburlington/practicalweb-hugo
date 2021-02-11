---
layout: post
title: IE6 on VirtualBox - installing the network driver
date: 2008-11-02T12:03:49Z
comments: true
tags:
  - testing
  - linux
  - ubuntu
  - web development
  - virtualbox
---

One of the trial of web development is ensuring that your site works across a range of browsers.

Standards compliance is an important part of this - but testing cannot be avoided.

I work on Ubuntu, and use VirtualBox together with a licensed copy of Windows XP to test in a Windows environment, which also allows me to at least test the Windows version of Safari.

Unfortunately Microsoft's decision to tie Internet Explorer closely with the operating system means that it isn't possible to install IE6 alongside IE7.

[Multiple IEs](http://tredosoft.com/Multiple_IE) gets close but doesn't exactly replicate each version, and isn't compatible with the IE developer toolbar)

[Microsoft have recognised the problem](http://blogs.msdn.com/ie/archive/2006/11/30/ie6-and-ie7-running-on-a-single-machine.aspx%22)
and do provide an [Internet Explorer Application Compatibility VPC Image](http://blogs.msdn.com/ie/archive/2006/11/30/ie6-and-ie7-running-on-a-single-machine.aspx)
which allows you to create a virtual Windows with IE6 installed

It is possible to [convert this image for use in VirtualBox](http://blog.mozmonkey.com/2008/vpc-ie6-ie7-ie8-on-mac-os-x/)

But I couldn't initially get the network working. What I had missed is that you have to

- go into the VirtualBox settings for this virtual machine
- in the to select the network section
- specify the &quot;PCnet-PCI II (am79C970A)" network adaptor
- boot up the vitual machine
- Windows will try and install the Driver
- Specify a location manually
- Browse to D:\32Bit\Windows\3rdParty\AMD_PCnet

The above assumes you have already installed the Guest Additions.

This should successfully install the network driver - it worked for me.

I now have a true copy of IE6 on Ubuntu and can test away.
