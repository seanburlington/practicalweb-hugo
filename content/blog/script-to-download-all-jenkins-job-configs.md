---
layout: post
title: Script to download all jenkins job configs
date: 2013-05-10T15:38:18+01:00
comments: true
tags:
  - jenkins
---

https://gist.github.com/seanburlington/5554803

```php
#!/usr/bin/php
<?php



$options = getopt("", array("server:", "login:", "ssl"));


if (!isset($options['server'])) {

	echo "
        Download all job config files from jenkins and place in the specified directory

        If copies of those config files already exist they will be overwritten

   usage : $argv[0] --server=jenkins.localdomain:8080 [--login=user:pass] [--directory=/home/me/somedir/] [--ssl]

        --server= (required) servername and port separated by a colon (unless on port 80 when just server name will do)
        --login=  username and password separated by a colon
        --directory= path to the directory you want the configs dropped in (defaults to the location of this script: " . dirname(__FILE__) . ")
        --ssl (if the server is https)


";
	exit;
}

if (isset($options['login'])) {
	$url = $options['login'] . "@" . $options['server'];
} else {
	$url = $options['server'];
}

$protocol = isset($options['ssl']) ? "https" : "http";


print "$url\n";
$result = file_get_contents("${protocol}://${url}/api/json");
#print "$result\n\n";
$data = json_decode($result);

#print_r($data->jobs);

#chdir(dirname(__FILE__));

foreach($data->jobs as $job) {
	print "$job->name\n";

	if (!is_dir("$job->name")) {
		mkdir("$job->name");
	}
	$config = file_get_contents("${protocol}://${url}/job/" . rawurlencode($job->name) . "/config.xml");
	file_put_contents("$job->name/config.xml", $config);
}

```
