# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.0'

gem 'importmap-rails'
gem 'jbuilder'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.2'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'bootsnap', require: false
gem 'dotenv-rails'
gem 'twilio-ruby', '~> 5.64'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
  gem 'faker'
  gem 'rubocop', require: false
end

group :test do
  gem 'factory_bot_rails', '~> 6.4.3'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  gem 'web-console'
end
