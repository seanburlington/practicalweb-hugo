---
layout: post
title: Mobile Internet and Ubuntu
date: 2008-05-25T11:44:01+01:00
comments: true
tags:
  - linux
  - contracting
---

I just got a new gadget - a mobile internet modem.

As ever the manufactures provide little support for us Linux users - but setup was pretty easy anyway.

I plugged it in and it was detected OK with full driver support.

Once installed it appears as any other modem would.

The only snag was that the Windows installer sets up it's own modem setup and doesn't give many clues what the configuration is!

A bit of googling later and I have a configuration file.

```
[Dialer defaults]
Modem = /dev/ttyUSB1
[Dialer three]
Init2 = ATZ
Init3 = ATQ0 V1 E1 S0=0 &amp;C1 &amp;D2 +FCLASS=0
Stupid Mode = 1
Modem Type = Analog Modem
ISDN = 0
Phone = *99\#
Modem = /dev/ttyUSB0
username = username
Password = password
Dial Command = ATDT
Baud =466600
Init4 = AT+CGDCONT=1,&quot;IP&quot;,&quot;three.co.uk&quot;
```

see also http://ubuntuforums.org/showthread.php?t=633981

Now, I have to confess I don't know what every line above does ...

I'm using wvdial to make the connection and this insists on a username/password - but three don't use one so just enter any value. The above is literally what I used.

The phone number is '\*99#' (# is a comment in wvdial.con so has to be escaped)

The [Mac guide](http://www.three.co.uk/threefiles/macdrivers/ConfigGuideUSBModemMac.pdf) was helpful - giving me the hint that three.co.uk was required in the init stages.

The Baud rate I took from a web post somewhere - I've tried tweaking it but the results are variable.

Details for various services available from:

[www.knowyourmobile.com/info/1310/uk_mobile_operators_internet_and_email_settings.html](http://www.knowyourmobile.com/info/1310/uk_mobile_operators_internet_and_email_settings.html)

## Service Details

The connections is [NAT'ed](http://en.wikipedia.org/wiki/Network_address_translation) so wouldn't be suitable for hosting services or running some games.

The service is filtered but not heavily - I can access ports for SSH, IMAPS, FTP.

All outgoing email (traffic to port 25) gets intercepted by three's email servers, this could be useful but could cause problems if you think you are connecting to a specific mail server.

Three also provide an SMTP sever you can configure explicitly at smtp.three.co.uk

I don't see any signs of a transparent HTTP proxy.

## Conclusion

I'm happy :-)

Connection speed reports at 1134Kbs up / 52 Kbs down - it's noticably slower than my ADSL line but quite usable.

I got this device primarily as a backup connection so that I can carry on working without interruption even if there is a local network problem. I also expect to be able to do the odd extra bit of work on the train or while away at weekends.

At £15 per month it won't take a great deal of extra billable work before I'm making a profit!

## It didn't work on Windows

I was disappointed with the lack of Linux instructions for this device - but interestingly for me as a Linux advocate: installing the device didn't work at all under windows!

Not only did installation require a couple of reboots and install extra software on my machine - but then it wouldn't connect.

One more reason to love Linux
