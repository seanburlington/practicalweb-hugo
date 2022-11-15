---
layout: post
title: "Add annotations to grafana via Elasticsearch"
date: 2015-04-27 21:43:55 +0100
comments: true
tags:
  - graphite
  - grafana
  - elasticsearch
  - javascript
---

It took me a while to figure out how to setup elasticsearch for grafana annotations, and I wanted a small page to allow me to add annotations

Mostly I figure we'll add a line to deploy scripts to track versions - but I'd like to be able to manually annotate outages

[this code as a gist](https://gist.github.com/seanburlington/29af780a56e09e3055ed#file-grafana-elasticsearch-annotations-html)

<!--more-->

```html
<!DOCTYPE html>
<html>
  <head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

    <script src="moment.min.js"></script>
    <script src="moment-timezone.js"></script>
    <script>
      $(document).ready(function () {
        $("#annotate").click(function () {
          var stuff = JSON.stringify({
            when_it_happened: $("#when_it_happened").val(),
            title: $("#title").val(),
            description: $("#description").val(),
          });

          $.post(
            "http://graphite.example.com:9200/events/prod/",
            stuff,
            function (data, status) {
              alert("Data: " + JSON.stringify(data) + "\nStatus: " + status);
            }
          );
        });
      });
    </script>
  </head>
  <body>
    <h1>Add an annotation to grafana</h1>

    <form>
      <p>
        <label for="title"> Title <input id="title" type="text" /></label>
      </p>
      <p>
        <label for="description">
          Description <input id="description" type="text"
        /></label>
      </p>
      <p>
        <label for="when_it_happened">
          Date/time <input id="when_it_happened" type="text"
        /></label>
        time is in UTC
      </p>
      <p><input id="annotate" type="button" value="Annotate!" /></p>
    </form>

    <script type="text/javascript">
      var today = new Date();
      var hour = today.getUTCHours();
      if (hour < 10) {
        hour = "0" + hour;
      }
      var minute = today.getUTCMinutes();
      if (minute < 10) {
        minute = "0" + minute;
      }

      //jQuery('#when_it_happened').datetimepicker({format:'Y-m-d\\TH:i:00.000\\Z', defaultTime : hour + ':' + minute });

      var now = moment.tz("UTC").format("YYYY-MM-DD\\THH:mm:00.000\\Z");
      jQuery("#when_it_happened").val(now);
    </script>
    <p>To setup the correct mapping on the server I run the following</p>

    <pre>
# delete all
curl -XDELETE  "http://graphite.example.com:9200/events/"
 
# create mapping
curl -XPUT graphite.example.com:9200/events -d '{
    "settings": {
        "index.number_of_shards": 1,
        "index.number_of_replicas": 0
    },
    "mappings": {
        "prod": {
            "_timestamp": {
                "enabled": "true"
            },
            "properties": {
                "title": {
                  "type": "string"
                },
                "description": {
                  "type": "string"
                },
                "when_it_happened": {
                    "type": "date",
                    "format": "yyyy-MM-dd'"'T'"'HH:mm:ss.SSSZ"
                }
            }
        }
    }
}
'
# test creating a record
curl -XPOST graphite.example.com:9200/events/prod/ -d '{
    "when_it_happened": "2015-04-27T18:30:14.000Z", "title" : "fake deploy", "description" : "Imagine that a deploy happened here"
}
'

# check mapping
GET "http://graphite.example.com:9200/events/_mapping?pretty=true"

# test search
curl -XPOST  "http://graphite.example.com:9200/events/_search?pretty=true" -d '{"fields":["when_it_happened"],"query":{"filtered":{"query":{"bool":{"should":[{"query_string":{"query":"*"}}]}},"filter":{"bool":{"must":[{"range":{"when_it_happened":{"from":"now-8y","to":"now+8y"}}}]}}}},"size":100}'

 
</pre
    >
  </body>
</html>
```
