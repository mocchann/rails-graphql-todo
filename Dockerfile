FROM ruby:3.3.9

WORKDIR /rails

RUN apt-get update -qq && \
    apt-get install -y postgresql-client && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./

COPY . .

RUN bundle install

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
