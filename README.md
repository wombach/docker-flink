# docker-flink

https://nightlies.apache.org/flink/flink-docs-master/docs/deployment/resource-providers/standalone/docker/#using-flink-python-on-docker

Building
---------
docker build . -t docker-flink:1.15.1.0

docker images
-> gives you the <image ID>

docker tag <image ID> wombach/docker-flink:1.15.1.0



docker ps 
provides you with the container Iid

for debugging check the log file
docker exec -it <container id> /bin/bash

publish the image to docker hub
docker push wombach/docker-flink:1.15.1.0

docker tag a1a6377f55bd wombach/docker-flink:1.15.1.0
docker push wombach/docker-flink:1.15.1.0

Starting
--------

```bash
docker run --network=host docker-flink:1.15.1.0 jobmanger
docker run --network=host docker-flink:1.15.1.0 taskmanager
```

run first example from your local system
```bash
cd  /mnt/c/Local2/code/virtualization/flink/flink-1.15.1/examples/python/table
/mnt/c/Local2/code/virtualization/flink/flink-1.15.1/bin/flink run  -py word_count.py
 ```

run first example from docker container
---------------------------------------
connect to the jobmanager
```bash
docker ps 
docker exec -it <container id> bash
cd /opt/flink/examples/python/table
/opt/flink/bin/flink run  -py word_count.py
```
will produce something like 
```
root@DESKTOP-9S5UVM3:/opt/flink/examples/python/table# /opt/flink/bin/flink run  -py word_count.py
WARNING: An illegal reflective access operation has occurred
WARNING: Illegal reflective access by org.apache.flink.api.java.ClosureCleaner (file:/opt/flink/lib/flink-dist-1.15.1.jar) to field java.lang.String.value
WARNING: Please consider reporting this to the maintainers of org.apache.flink.api.java.ClosureCleaner
WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
WARNING: All illegal access operations will be denied in a future release
Job has been submitted with JobID 4fa41a22e8c5fa3616ff3b900754770c
Executing word_count example with default input data set.
Use --input to specify file input.
Printing result to stdout. Use --output to specify output path.
```

Access jobmanager
http://[::1]:8081/