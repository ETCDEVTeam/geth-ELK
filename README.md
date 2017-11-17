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

