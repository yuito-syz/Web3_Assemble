FROM ruby:3.1.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /portfolio

WORKDIR /portfolio

COPY Gemfile /portfolio/Gemfile
COPY Gemfile.lock /portfolio/Gemfile.lock

RUN bundle install

COPY . /portfolio

# 挿入候補
# ADD sqlite-docker /sqlite-docker
# WORKDIR /
# CMD ["/sqlite-docker"]