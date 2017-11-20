## Instructions

install `filebeat`, `logstash`, `elasticsearch`, and `kibana`. i know, it's
a lot. if you're not on OSX, you're on your own here.
```
brew install filebeat logstash elasticsearch kibana
```

turn geth on.
> terminal 1
```
geth --mlog=json --log-status="sync=10" --cache 100 --log-dir=`d Class`/mainnet/log --rpc --ws --ws-port=3000 --verbosity 6
```

turn filebeat on.
> terminal 2
```
# $(pwd) == cd geth-ELK repo, eg., use this file instead of the default config
# file
filebeat -e -c $(pwd)/filebeat.geth.mlog.json.yml -d "publish"
```

turn logstash on. again, this should use _this_ file, not the default config.
you can either copy/rename this file to the default logstash config dir, or use
it relatively from the command.
> terminal 3
```
logstash -f ls-pipeline-json.conf --config.reload.automatic
```

turn elastic search on.
> terminal 4
```
elasticsearch
```

turn kibana on.
> terminal 5
```
kibana
```

Now you can open `localhost:5601` in the browser and find kibana.

You may need to create an index on `logstash-*`.


----


Reference documents for setting up ELK with geth's forthcoming `mlog`
implementation.

- Elasticsearch
- Logstash
- Kibana


[setup.sh](./setup.sh) is just pseudo-code. Don't try running it. Just
documenting the e-l-k pattern.

[kibana-save-searches-example.json](./kibana-save-searches-example.json) are
two Saved Search examples from Kibana made with the Kibana Export function.
You should be able to Import this file to setup the searches

- WRITE BLOCK
- SERVER ADD PEER


![example](./block-write-search-example.png)

----

> etcstats.net
```
# not sure ws is required
geth --ws --ws-port=3000 --rpc

# go to the net stats thingey
cd dev/etc/net-stats-api-eth-whatever
npm install
env WS_SERVER=rpc.etcstats.net WS_SECRET=5ceuMix4qSM6APj7QwTPU npm start app.json
```

