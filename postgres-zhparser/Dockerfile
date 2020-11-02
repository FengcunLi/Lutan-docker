FROM postgres:10


RUN apt-get update \
    && apt-get install -y \ 
    bzip2 git make gcc postgresql-server-dev-10 libc-dev ca-certificates openssl

ADD http://www.xunsearch.com/scws/down/scws-1.2.3.tar.bz2 /

WORKDIR /
RUN tar -xjf scws-1.2.3.tar.bz2 && cd scws-1.2.3 && ./configure && make install

ENV SCWS_HOME=/usr/local
RUN git clone https://github.com/amutu/zhparser.git && cd zhparser && make && make install


RUN echo "CREATE EXTENSION pg_trgm; \n\
    CREATE EXTENSION zhparser; \n\
    CREATE TEXT SEARCH CONFIGURATION chinese_zh (PARSER = zhparser); \n\
    ALTER TEXT SEARCH CONFIGURATION chinese_zh ADD MAPPING FOR n,v,a,i,e,l,t WITH simple;" \
    > /docker-entrypoint-initdb.d/init-zhparser.sql

RUN apt-get purge -y bzip2 git make gcc libc-dev postgresql-server-dev-10 \
    && apt-get autoremove -y \
    && rm -rf \
    /zhparser \
    /scws-1.2.3
