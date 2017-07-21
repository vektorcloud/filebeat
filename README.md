# [Filebeat](https://www.elastic.co/products/beats/filebeat) on Alpine

## Usage

    docker run --rm -ti -v -e ES_HOSTS=127.0.0.1:9200 /var/log:/var/log quay.io/vektorcloud/filebeat
