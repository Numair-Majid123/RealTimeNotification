FROM ruby:3.3.0-bookworm

WORKDIR /rails

COPY Gemfile Gemfile.lock ./
COPY . .

RUN bundle config --local set path 'vendor/bundle' && bundle install

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
