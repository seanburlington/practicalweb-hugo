---
layout: post
title: "Importing Legacy Data for use as an LDAP Addressbook "
date: 2005-08-07T17:08:05+01:00
comments: true
tags:
  - ldap
---

This
is something I played around with ages ago and didn’t make notes on -
now I’m doing a little more work pulling together what I learned then
along with some new stuff.

In /etc/ldap/slapd.conf

Pull in some standard schemas

```
include         /etc/ldap/schema/core.schema
include         /etc/ldap/schema/cosine.schema
include         /etc/ldap/schema/nis.schema
include         /etc/ldap/schema/inetorgperson.schema
include         /etc/ldap/schema/mozillaOrgPerson_V0.6.1.schema
```

define what are effectively the names of your database, the admin username and the admin password,
I’ve used my domain name as the database name as this more or less
guarantees the name is globally unique which can be useful, it’s also
easy to remember
The password is generated with `/usr/bin/ldappasswd` (part of the ldap-utils package)

```

# Define the root suffix you serve.
suffix "dc=uncertainty,dc=org,dc=uk"
# Define a root DN for superuser privileges.
rootdn "cn=Manager,dc=uncertainty,dc=org,dc=uk"
# Define the password used with rootdn.
rootpw \***\*\*\*\*\*\***

```

Define read permissions as required for other users, set loglevel to
256 if you want to view queries being sent to the server for debugging

Next create an ldif file that defines your first ?container? followed by any entries

```

# Organization for Example Corporation

dn: dc=uncertainty,dc=org,dc=uk
objectClass: dcObject
objectClass: organization
dc: uncertainty
o: Example Corporation
description: The Example Corporation
dn: cn=someone,dc=uncertainty,dc=org,dc=uk
cn: someone
sn: someone
postalCode: AB12 XQ7
homePostalAddress: a place somewhere
mail: fake@test.bla
objectclass: inetOrgPerson

```

This can be entered with the command

`ldapadd -x -D "cn=Manager,dc=uncertainty,dc=org,dc=uk" -W -f test.ldif`

which will prompt for the password created earlier

`ldapmodify` can be used to add (-a) or update (default) use option -c to keep going even if errors are encountered

Configure your client to use Base DN as specified earlier - in my case dc=uncertainty,dc=org,dc=uk

## Useful links

- [Bug 116692 Define official Mozilla LDAP schema extension](https://bugzilla.mozilla.org/show_bug.cgi?id=116692)

- [YoLinux: OpenLDAP 2.x Schema Extension to support MS/Outlook, Netscape 4.5+](http://www.yolinux.com/TUTORIALS/LinuxTutorialLDAP-GILSchemaExtension.html)

- [OpenLDAP Faq-O-Matic : MS Outlook: How Do LDAP Attributes Map to Address Book Fields?](http://www.openldap.org/faq/data/cache/294.html)
