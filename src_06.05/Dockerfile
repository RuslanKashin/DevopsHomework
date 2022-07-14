FROM centos:7

COPY elasticsearch-8.3.2-linux-x86_64.tar.gz  /opt

RUN cd /opt && \
    groupadd elastic_grp && \
    useradd -g elastic_grp elastic_usr &&\
    tar -xzf elasticsearch-8.3.2-linux-x86_64.tar.gz && \
    rm elasticsearch-8.3.2-linux-x86_64.tar.gz && \ 
    mkdir /var/lib/elastic_data /opt/elasticsearch-8.3.2/snapshots && \
    chown -R elastic_usr:elastic_grp /opt/elasticsearch-8.3.2 && \
    chown elastic_usr:elastic_grp /var/lib/elastic_data

ENV ES_HOME=/opt/elasticsearch-8.3.2
USER elastic_usr
WORKDIR /opt/elasticsearch-8.3.2/
COPY elasticsearch.yml  config/
EXPOSE 9200 9300
CMD [ "bin/elasticsearch" ]

