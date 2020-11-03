FROM python:3.8.6-slim-buster

# RUN sed -i 's#http://deb.debian.org#http://mirrors.aliyun.com#g' /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y gcc libpq-dev git postgresql-client \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/FengcunLi/Lutan-backend.git

WORKDIR /Lutan-backend
RUN pip3 install -r requirements.txt -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com --no-cache-dir
