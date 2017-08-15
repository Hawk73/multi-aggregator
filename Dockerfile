FROM ruby:2.4.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

#TODO: remove bash ??
RUN bash -l -c 'bundle install --jobs 2'

#COPY . /app
ADD . /app

ENTRYPOINT ["./docker/entrypoint.sh"]

EXPOSE 3000
