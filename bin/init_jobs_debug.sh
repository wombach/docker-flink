#!/bin/bash

# start production flink jobs
./init_jobs.sh

# start debug flink jobs
cd /opt/flink/py_libs/m4i-flink-tasks/scripts 
/opt/flink/bin/flink run -d -py dump_events_job_atlas.py >> /tmp/log.out
/opt/flink/bin/flink run -d -py dump_events_job_determine_change.py >> /tmp/log.out
/opt/flink/bin/flink run -d -py dump_events_job_get_entity.py >> /tmp/log.out
