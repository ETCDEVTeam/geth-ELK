## Instructions

Install `filebeat`, `logstash`, `elasticsearch`, and `kibana`.
```
brew install filebeat logstash elasticsearch kibana
```

#### Geth
Turn geth on. The only required flag here is `--mlog`, and I'm using `=json`
because I've found it easier to move through logstash (don't have to `grok`
nearly as much).
> Terminal 1
```
geth --mlog=json --log-status="sync=10" --cache 100 --log-dir=~/LibraryEthereumClassic/mainnet/log --rpc --ws --ws-port=3000 --verbosity 6
```
:arrow_down:

#### Filebeat
Run from geth-ELK repo, eg., use this repo's logstash config file instead of the default config
file, or move/copy it to filebeat's config dir (`/usr/local/etc/filebeat`).
filebeat -e -c
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
> Terminal 3
```
logstash -f ls-pipeline-json.conf --config.reload.automatic
```
:arrow_down:

#### Elasticsearch
Turn elastic search on.
> Terminal 4
```
elasticsearch
```
:arrow_down:

#### Kibana
Turn kibana on.
> Terminal 5
```
kibana
```
:arrow_down:

Now you can open `localhost:5601` in the browser and find kibana.

You may need to use Kibana's `Management`->`Index Patterns` to create indexes for `logstash-*`.

