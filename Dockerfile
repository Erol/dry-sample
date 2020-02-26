FROM ruby:2.6.2-alpine AS bundler

RUN apk add --update build-base git mysql-dev nodejs npm tzdata

WORKDIR /app


FROM ruby:2.6.2-alpine AS app

RUN apk add --update build-base git mysql-dev nodejs npm tzdata
RUN npm install -g yarn

WORKDIR /app

ADD Gemfile* ./
ADD vendor/bundle /cache/bundle

RUN bundle check --path /cache/bundle || bundle install --jobs 2 --clean --path /cache/bundle
