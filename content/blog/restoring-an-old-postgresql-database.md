---
layout: post
title: "Restoring an old Postgresql database"
date: 2008-01-16T16:08:05Z
comments: true
tags:
  - postgresql
---

I’ve just had cause to restore a two year old backup of a database I haven’t used in a whileSince then postgresql (on Debian at least) has added the option to have multiple ‘clusters’ and multple versions running on the same machine.

Fortunately the old version (7.4) was still available

Steps

<!--more-->

- `restore /var/lib/postgresql/data`
- `restore /etc/postgresql`
- `mkdir /var/lib/postgresql/7.4`
- `mv /var/lib/postgresql/data /var/lib/postgresql/7.4/`
- `chown -R postgres.postgres /var/lib/postgresql/7.4/`
- `pg_createcluster 7.4 data` (this moves the old data into the new structure)
- `pg_upgradecluster 7.4 data` (upgrade the data to the latest postgres version installed)

Other issues: my old data was in a character set I didn’t have installed as I now use UTF8

I had to add `en_GB ISO-8859-1` to `/etc/locale.gen`

and run `locale-gen`

But I now have access to my old data in both old and new server versions (I’ll probably delete the old one but it might be useful for testing)
