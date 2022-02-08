FROM node:17.4

WORKDIR /app

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo,

COPY package*.json ./

RUN npm install

COPY . .

ADD . /app
