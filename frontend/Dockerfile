FROM node:12-buster-slim

# RUN sed -i 's#http://deb.debian.org#http://mirrors.aliyun.com#g' /etc/apt/sources.list

COPY ./ /
WORKDIR /

RUN apt-get update \
    && apt-get install -y git
RUN git clone https://github.com/FengcunLi/Lutan-frontend.git

WORKDIR /Lutan-frontend
RUN yarn install && yarn build

FROM nginx

RUN mkdir /app
COPY --from=0 /Lutan-frontend/dist /app
