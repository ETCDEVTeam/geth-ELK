#!/usr/bin/env bash

brew install kibana elasticsearch logstash filebeat

cp filebeath.geth.mlog.yml /usr/local/etc/filebeat/

# writes mlogs to default mlog directory, as specified in filebeath.geth config
geth

# t1
# sends to logstash at 5043
filebeat -e -c filebeat.geth.mlog.yml -d "publish"

# t2
# sends to elasticsearch at 9200
logstash -f ls-pipeline-1.conf --config.reload.automatic

# t3
# connects on 9200
elasticsearch

# t4
# connects to elasticsearch on 9200, publishes on 5601
kibana

open http://localhost:5601





