#!/bin/bash

# start flink jobs
cd /opt/flink/py_libs/m4i-flink-tasks/scripts 
/opt/flink/bin/flink run -d -py get_entity_job.py >> /tmp/log.out
/opt/flink/bin/flink run -d -py publish_state_job.py >> /tmp/log.out
/opt/flink/bin/flink run -d -py determine_change_job.py >> /tmp/log.out
