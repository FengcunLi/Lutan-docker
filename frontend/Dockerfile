FROM node:10

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
