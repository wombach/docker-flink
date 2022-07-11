# docker-flink

https://nightlies.apache.org/flink/flink-docs-master/docs/deployment/resource-providers/standalone/docker/#:~:text=The%20Flink%20Docker%20repository%20is,aliases%20are%20provided%20for%20convenience.

Building
---------
docker build . -t docker-flink:1.15.0.0

docker images
-> gives you the <image ID>

docker tag <image ID> wombach/docker-flink:1.15.0.0



docker ps 
provides you with the container Iid

for debugging check the log file
docker exec -it <container id> /bin/bash

publish the image to docker hub
docker push wombach/docker-flink:1.15.0.0

docker tag a1a6377f55bd wombach/docker-flink:1.15.0.0
docker push wombach/docker-flink:1.15.0.0

Starting
--------

```bash
docker run --network=host docker-flink:1.15.0.0 jobmanger
docker run --network=host docker-flink:1.15.0.0 taskmanager
```

run first example
```bash
 /mnt/c/Local2/code/virtualization/flink/flink-1.15.0/bin/flink run  -py word_count.py
 ```