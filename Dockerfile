FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /ToDone
WORKDIR /ToDone
COPY Gemfile /ToDone/Gemfile
COPY Gemfile.lock /ToDone/Gemfile.lock
RUN bundle install
COPY . /ToDone
