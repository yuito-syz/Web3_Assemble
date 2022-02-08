FROM ruby:3.1.0

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

ADD . /app