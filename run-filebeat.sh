#!/usr/bin/env bash

filebeat -v -e -path.config=. -c filebeat.geth.mlog.json.yml -d "publish"
