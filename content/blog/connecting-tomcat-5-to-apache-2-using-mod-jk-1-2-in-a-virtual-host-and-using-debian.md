---
layout: post
title: "Connecting Tomcat 5 to apache 2 using mod jk 1.2 (in a virtual host and using Debian) "
comments: true
date: 2005-04-09T17:08:05+01:00
tags:
  - java
  - apache
  - tomcat
---

This is fairly well documented on the apache site - but you have to pull
info together from a few pages and the importance of virtual servers is
easy to miss.

1. Make sure you have the development package for apache (you need apxs2 installed) taking care to get the right apache2-dev package

   I ran apt-get install apache2-prefork-dev

1. [Download the Source](http://www.apache.org/dist/jakarta/tomcat-connectors/jk/source/) (so that you can compile for your platform and your version of apache)
1. extract the jk-connector source

1. Change to the build directory

   `cd jakarta-tomcat-connectors-1.2.10-src/jk/native`

1. clean with make clean

1. Configure for your apache with `./configure --with-apxs=/usr/bin/apxs2`

1. Build the module with `make`

1. Switch to root

1. Copy the module to the apache modules directory `cp apache-2.0/mod_jk.so /usr/lib/apache2/modules/`

1. Create a load module file for apache `/etc/apache2/mods-available/mod_jk.load`

   This file should just contain the line

   `LoadModule jk_module /usr/lib/apache2/modules/mod_jk.so`

1. Create a Conf module `/etc/apache2/mods-available/mod_jk.conf`

   Mine looks like this (still at the testing stage)

   ```
   JkWorkersFile /etc/apache2/workers.properties
   ```

# Where to put jk logs

`JkLogFile /tmp/mod_jk.log`

# Set the jk log level [debug/error/info]

`JkLogLevel debug JkLogStampFormat "[%a %b %d %H:%M:%S %Y] "`

# JkOptions indicate to send SSL KEY SIZE,

`JkOptions +ForwardKeySize +ForwardURICompat -ForwardDirectories`

# JkRequestLogFormat set the request format

`JkRequestLogFormat "%w %V %T"`

The [official howto](http://jakarta.apache.org/tomcat/connectors-doc/howto/apache.html)
suggests that JkRequestLogFormat and JkMount can be configured on a per
virtual host basis - the other directives seem to be required in the
main apache config.

1. enable these modules in the usual way by creating symlinks from mods-enabled to the files in mods-available

1. Create a workers file (in the place specified above) `/etc/apache2/workers.properties`

```
workers.tomcat_home=/usr/local/jakarta-tomcat-5.0.18/
workers.java_home=/usr/local/java/j2sdk1.4.2_04/
ps=/

```

# Define 1 real worker using ajp13

worker.list=worker1

# Set properties for worker1 (ajp13)

```
worker.worker1.type=ajp13
worker.worker1.host=127.0.0.1
worker.worker1.port=8009
worker.worker1.lbfactor=50
worker.worker1.cachesize=10
worker.worker1.cache_timeout=600
worker.worker1.socket_keepalive=1
worker.worker1.reclycle_timeout=300

```

I’m not sure if the first 3 lines are required.

1. Add a line in your Virtual host config such as

   `JkMount /manager/html/\* worker1`

1. Restart apache

1. You should now be able to access your tomcat app as http://yourvirtualhost/manager/html/

   (or whichever apps you have used)

[the official quick guide to workers](http://jakarta.apache.org/tomcat/connectors-doc/howto/quick.html)

## Trouble Shooting

I had problems getting this working, it turned out to be because I
had configured the jk directives in the vitual host sectionm of my
apache config but the error messages were not helpful - I just got
`jk_handler::mod_jk.c (1983): Could not find a worker for worker name=worker1`

### Testing the setup

Can you telnet to the apj13 port?

`telnet 127.0.0.1 8009`

You should see something like

```
Trying 127.0.0.1...
Connected to 127.0.0.1.
Escape character is '^]'

```

If this works your tomcat setup is OK - if not check your `server.xml` settings.

NB you can restrict tomcat to only listen to localhost by adding an address parameter like

```
<Connector address="127.0.0.1" port="8009" protocol="AJP/1.3" protocolHandlerClassName="org.apache.jk.server.JkCoyoteHandler" redirectPort="8443">

```

When I had tomcat running correctly and mod jk configured this is the output in my jk log

```

[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] do_shm_open::jk_shm.c (213): Using process memory as shared memory
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] init_jk::mod_jk.c (2341): Initialized shm:memory
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] uri_worker_map_open::jk_uri_worker_map.c (324): rule map size is 0
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] build_worker_map::jk_worker.c (219): creating worker worker1
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] wc_create_worker::jk_worker.c (125): about to create instance worker1 of aj
p13
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] wc_create_worker::jk_worker.c (138): about to validate and init worker1
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_validate::jk_ajp_common.c (1781): worker worker1 contact is '127.0.0.1:
8009'
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1870): setting socket keepalive to 1
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1909): setting socket timeout to -1
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1913): setting socket buffer size to 0
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1917): setting connection recycle timeout to 0
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1921): setting cache timeout to 600
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1925): setting connect timeout to 0
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1929): setting reply timeout to 0
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1933): setting prepost timeout to 0
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1937): setting recovery opts to 0
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_init::jk_ajp_common.c (1941): setting number of retries to 3
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] ajp_create_endpoint_cache::jk_ajp_common.c (1818): setting connection cache
size to 10
[Sat Apr 09 22:21:48 2005] [23190:16512] [debug] build_worker_map::jk_worker.c (231): removing old worker1 worker
[Sat Apr 09 22:21:49 2005] [23190:16512] [debug] jk_cleanup_shmem::mod_jk.c (1735): Shmem cleanup
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] do_shm_open::jk_shm.c (213): Using process memory as shared memory
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] init_jk::mod_jk.c (2341): Initialized shm:memory
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] uri_worker_map_open::jk_uri_worker_map.c (324): rule map size is 0
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] build_worker_map::jk_worker.c (219): creating worker worker1
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] wc_create_worker::jk_worker.c (125): about to create instance worker1 of aj
p13
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] wc_create_worker::jk_worker.c (138): about to validate and init worker1
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_validate::jk_ajp_common.c (1781): worker worker1 contact is '127.0.0.1:
8009'
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1870): setting socket keepalive to 1
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1909): setting socket timeout to -1
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1913): setting socket buffer size to 0
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1917): setting connection recycle timeout to 0
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1921): setting cache timeout to 600
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1925): setting connect timeout to 0
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1929): setting reply timeout to 0
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1933): setting prepost timeout to 0
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1937): setting recovery opts to 0
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_init::jk_ajp_common.c (1941): setting number of retries to 3
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] ajp_create_endpoint_cache::jk_ajp_common.c (1818): setting connection cache
size to 10
[Sat Apr 09 22:21:49 2005] [23191:16512] [debug] build_worker_map::jk_worker.c (231): removing old worker1 worker
[Sat Apr 09 22:21:50 2005] [23192:16512] [debug] do_shm_open::jk_shm.c (213): Using process memory as shared memory
[Sat Apr 09 22:21:50 2005] [23192:16512] [debug] jk_child_init::mod_jk.c (2307): Attached shm:memory
[Sat Apr 09 22:21:50 2005] [23192:16512] [debug] jk_child_init::mod_jk.c (2317): Initialized mod_jk/1.2.10
[Sat Apr 09 22:21:50 2005] [23193:16512] [debug] do_shm_open::jk_shm.c (213): Using process memory as shared memory
[Sat Apr 09 22:21:50 2005] [23193:16512] [debug] jk_child_init::mod_jk.c (2307): Attached shm:memory
[Sat Apr 09 22:21:50 2005] [23193:16512] [debug] jk_child_init::mod_jk.c (2317): Initialized mod_jk/1.2.10
[Sat Apr 09 22:21:50 2005] [23194:16512] [debug] do_shm_open::jk_shm.c (213): Using process memory as shared memory
[Sat Apr 09 22:21:50 2005] [23194:16512] [debug] jk_child_init::mod_jk.c (2307): Attached shm:memory
[Sat Apr 09 22:21:50 2005] [23194:16512] [debug] jk_child_init::mod_jk.c (2317): Initialized mod_jk/1.2.10
[Sat Apr 09 22:21:50 2005] [23195:16512] [debug] do_shm_open::jk_shm.c (213): Using process memory as shared memory
[Sat Apr 09 22:21:50 2005] [23195:16512] [debug] jk_child_init::mod_jk.c (2307): Attached shm:memory
[Sat Apr 09 22:21:50 2005] [23195:16512] [debug] jk_child_init::mod_jk.c (2317): Initialized mod_jk/1.2.10
[Sat Apr 09 22:21:50 2005] [23196:16512] [debug] do_shm_open::jk_shm.c (213): Using process memory as shared memory
[Sat Apr 09 22:21:50 2005] [23196:16512] [debug] jk_child_init::mod_jk.c (2307): Attached shm:memory
[Sat Apr 09 22:21:50 2005] [23196:16512] [debug] jk_child_init::mod_jk.c (2317): Initialized mod_jk/1.2.10

```

The above appeared on apache startup - before any requests were made.

Even when it wasn’t working I could see apache trying to map requests to tomcat

```

[Sat Apr 09 22:24:39 2005] [23193:16512] [debug] map_uri_to_worker::jk_uri_worker_map.c (455): Attempting to map URI '/manager/html/' from 0 maps
```
