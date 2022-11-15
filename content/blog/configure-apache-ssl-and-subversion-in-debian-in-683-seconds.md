---
layout: post
title: "Configure Apache SSL and Subversion in Debian in 683 seconds "
date: 2007-12-02T16:15:44Z
comments: true
tags:
  - svn
  - apache
---

Shamelessly copied from:

[Configure Apache SSL and Subversion in Debian in 683 seconds](http://www.geocities.com/arhuaco/doc/subversion/apache-subversion-in-debian.html)

This just saved me lots of time and I want to keep a copy for later - just in case…

Mar 26 2005

(The apache2+SSL part was taken from the article Debian, Apache2 and SSL by Ian Miller)

<!--more-->

Debian Sarge comes with an apache2 package. I thought I’d give this
a go to get it working with a self signed SSL certificate. However, I
had little idea of what I was doing. Eventually I worked it out - and
it’s easy:

    * Login or su as root

- Run:

apt-get install apache2

    * Run the script

apache2-ssl-certificate

and tell it what it wants to know.

    * Make a copy of ‘/etc/apache2/sites-available/default’ - call it something like ’ssl’

- Make a sym-link to this new site configuration from
  /etc/apache2/sites-enabled/ You will see this is already for
  ‘default’.

      * Add a

Listen 443

to /etc/apache2/ports.conf

- Edit /etc/apache2/sites-available/ssl (or whatever you called
  your new ssl site’s config) and change port 80 in the name of the site
  to 443. Also change the virtual host setting. Add the lines “SSLEngine
  On”, “SSLCertificateFile /etc/apache2/ssl/apache.pem” and “LoadModule
  ssl_module /usr/lib/apache2/modules/mod_ssl.so”. My config file reads:

NameVirtualHost \*:443

LoadModule ssl_module /usr/lib/apache2/modules/mod_ssl.so
SSLEngine On
SSLCertificateFile /etc/apache2/ssl/apache.pem

…

    * Restart apache2

/etc/init.d/apache2 restart

    * HTTPS should work.

Try: https://hostname/

    * Now, let’s start with subversion.

apt-get install libapache2-svn subversion subversion-tools

    * Create a repository.

cd /home
mkdir svn
chown www-data svn
su www-data -c “svnadmin create svn/src”

    * If you let your users run as www-data they will be able to write to your repository!


    * Become root again and add the following lines our apache configuration (ssl), inside of the VirtualHost declaration.

DAV svn
SVNPath /home/svn/src

    AuthType Basic

AuthName “My Subversion Repository”
AuthUserFile /home/svn/.dav_svn.passwd
Require valid-user

    * Use this instead of “Require valid-user” if you don’t want to use passwords for read-only access

Require valid-user

    * Let’s add some users.

su www-data -c “htpasswd2 -c -m /home/svn/.dav_svn.passwd galactus”

    * Add another user (don’t use -c or it will recreate the file)

su www-data -c “htpasswd2 -m /home/svn/.dav_svn.passwd ceruno”
su www-data -c “htpasswd2 -m /home/svn/.dav_svn.passwd n”

    * Test the repository

1.  Using your browser. Load https://hostname/svn/src/ in your
    browser. Replace hostname with your host name or ip. You will get
    something like:

Revision 0: /
Powered by Subversion version 1.1.3 (r12730).

1.  From the command line:

svn –username n import checkers https://localhost/svn/src -m “initial import”
Authentication realm: My Subversion Repository
Password for ‘n’:
Adding checkers/trunk
Adding checkers/trunk/gendelta.pl
Adding checkers/site
Adding checkers/branches
Adding checkers/tags

Committed revision 1.

    * Load from the browser again.

Revision 1: /

- branches/
- site/
- tags/
- trunk/
  Powered by Subversion version 1.1.3 (r12730).

      * And that’s all so far.
