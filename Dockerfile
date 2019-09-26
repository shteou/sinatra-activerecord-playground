FROM ruby:2.5.3-alpine

RUN apk update && \
    apk add --no-cache \
            alpine-sdk \
            ruby-dev \
            mysql-client \
            zlib-dev \
            xz-dev \
            util-linux \
            mariadb-dev \
            tzdata


RUN mkdir -p /app
WORKDIR /app

RUN gem update --system
RUN gem install bundler --no-document -v 2.0.1

ADD Gemfile /app/
RUN bundle install -j4

ADD . /app/

CMD ["thin", "-p", "8080", "-a", "0.0.0.0", "start"]
