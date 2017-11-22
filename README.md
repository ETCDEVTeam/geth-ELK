## Overview

## Instructions

Install `filebeat`, `logstash`, `elasticsearch`, and `kibana`.
```
brew install filebeat logstash elasticsearch kibana
```

#### Geth
Turn geth on. The only required flag here is `--mlog`, though of course you can
use any others as well. I'm using `=json`
because I've found it easier to move through logstash (don't have to `grok`
nearly as much).

Geth writes mlogs by default to `/Users/you/EthereumClassic/mainnet/mlogs`. You
can change this directory with the `--mlog-dir=</path/to/mlogs>` flag. The
default is assumed in the Filebeat config `filebeat.geth.mlog.json.yml`.
> Terminal 1
```
geth --mlog=json
```
:arrow_down:

#### Filebeat
Run from geth-ELK repo, eg., use this repo's logstash config file instead of the default config
file, or move/copy it to filebeat's config dir (`/usr/local/etc/filebeat`).

Note that `filebeat.geth.mlog.json.yml` uses an input `path` with a wildcard
for convenience.

Filebeat publishes to Logstash on port `5043`.
> Terminal 2
```
echo $(pwd)
> ~/dev/geth-ELK
filebeat -e -c $(pwd)/filebeat.geth.mlog.json.yml -d "publish"
```
:arrow_down:

#### Logstash
Turn logstash on. Again, this should use _this repo's_ config file, not the default config.
You can either copy/rename this file to the default logstash config dir, or use
it relatively from the command.

Logstash publishes to Elasticsearch on port `9200`.
> Terminal 3
```
logstash -f ls-pipeline-json.conf --config.reload.automatic
```
:arrow_down:

#### Elasticsearch
Turn elastic search on.

Elasticsearch connects on `9200`.
> Terminal 4
```
elasticsearch
```
:arrow_down:

#### Kibana
Turn kibana on.

Kibana connects with Elasticsearch on `9200`, and publishes on `5601`.
> Terminal 5
```
kibana
```
:arrow_down:

Now you can open `localhost:5601` in the browser and find kibana.

You may need to use Kibana's `Management`->`Index Patterns` to create indexes for `logstash-*`.

