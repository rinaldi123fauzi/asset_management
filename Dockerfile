FROM ruby:2.6.6

RUN apt-get update && apt-get install -y build-essential

WORKDIR /usr/src/app

RUN gem install bundler -v 2.2.16

COPY . .
RUN bundle install

RUN apt-get install -y ruby-dev

RUN bundle config set force_ruby_platform true

RUN apt-get update

RUN apt-get install -y nodejs
