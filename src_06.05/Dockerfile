FROM centos:7

COPY elasticsearch-8.3.2-linux-x86_64.tar.gz  /opt

RUN cd /opt && \
    groupadd elastic_grp && \
    useradd -g elastic_grp -p elastic elastic_usr &&\
    tar -xzf elasticsearch-8.3.2-linux-x86_64.tar.gz && \
    rm elasticsearch-8.3.2-linux-x86_64.tar.gz && \ 
    mkdir /var/lib/elastic_data && chmod -R 777 /var/lib/elastic_data && \
    chown -R elastic_usr:elastic_grp /opt/elasticsearch-8.3.2

USER elastic_usr
WORKDIR /opt/elasticsearch-8.3.2/
COPY elasticsearch.yml  config/
EXPOSE 9200 9300
ENTRYPOINT ["bin/elasticsearch"]
