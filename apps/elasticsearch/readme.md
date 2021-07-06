chown elasticsearch.root <local/es_data> -R
chmod 755 <local/es_data> -R 


docker-compose.yml
version: '2'
services:
  elasticsearch-master-1:
    image: docker.elastic.co/elasticsearch/elasticsearch:5.1.1
    container_name: master-1
    labels:
      type: master-node
    environment:
      - cluster.name=ISSUE22
      - node.name=master-1
      - bootstrap.memory_lock=true
      - discovery.zen.ping.unicast.hosts=elasticsearch-master-2
      - discovery.zen.minimum_master_nodes=2
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"
      - node.master=true
      - node.data=false
      - node.ingest=false
      - xpack.security.enabled=false
    ulimits:
      memlock:
        soft: -1
        hard: -1
      nofile:
        soft: 65536
        hard: 65536
    mem_limit: 1000000000
