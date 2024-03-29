FROM flink:1.15.1-scala_2.12-java11

# install python3: it has updated Python to 3.9 in Debian 11 and so install Python 3.7 from source
# it currently only supports Python 3.6, 3.7 and 3.8 in PyFlink officially.

RUN apt-get update -y && \
    apt-get install -y curl && \
    apt-get install -y jq && \
    apt-get install -y ca-certificates && \
    apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev libffi-dev && \
    wget https://www.python.org/ftp/python/3.8.9/Python-3.8.9.tgz && \
    tar -xvf Python-3.8.9.tgz && \
    cd Python-3.8.9 && \
    ./configure --without-tests --enable-shared && \
    make -j6 && \
    make install && \
    ldconfig /usr/local/lib && \
    cd .. && rm -f Python-3.8.9.tgz && rm -rf Python-3.8.9 && \
    ln -s /usr/local/bin/python3 /usr/local/bin/python && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install PyFlink
RUN apt-get update -y &&\
    apt-get install -y net-tools &&\
    apt-get install -y git && \
    # only used for devlopment
    apt-get install -y vim 

USER flink
RUN mkdir /opt/flink/py_libs && \
    cd /opt/flink/py_libs && \
    git clone --single-branch https://github.com/aureliusenterprise/m4i-flink-tasks.git && \
    wget https://dlcdn.apache.org/flink/flink-1.15.1/python/apache-flink-1.15.1.tar.gz && \
    wget https://dlcdn.apache.org/flink/flink-1.15.1/python/apache-flink-libraries-1.15.1.tar.gz && \
    pip3 install ./apache-flink-libraries*.tar.gz && pip3 install ./apache-flink*.tar.gz

# install required jar files
USER flink
RUN cd  /opt/flink/py_libs/m4i-flink-tasks/flink_jars && \
    wget https://repo.maven.apache.org/maven2/org/apache/flink/flink-connector-kafka/1.15.1/flink-connector-kafka-1.15.1.jar && \
    wget https://repo.maven.apache.org/maven2/org/apache/kafka/kafka-clients/2.2.1/kafka-clients-2.2.1.jar

COPY ./bin/ /opt/flink/init/