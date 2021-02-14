#!/bin/bash 

hugo  --minify --cleanDestinationDir
firebase deploy
