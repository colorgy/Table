source 'https://rubygems.org'

ruby '2.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', group: [:development, :test]
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

gem 'pg', group: [:production]
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
gem 'materialize-sass'
gem 'bootstrap-sass', '~> 3.3.4'
gem 'devise'
gem 'will_paginate', '~> 3.0.6'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Loads environment variables from `.env`
gem 'dotenv-rails', :groups => [:development, :test]

gem 'omniauth-colorgy-oauth2'

# Model factory and tools
gem 'factory_girl_rails', '~> 4.5.0'
gem 'faker'
gem 'timecop'

gem 'activeresource', '~> 4.0.0'
gem 'cached_resource'

# Use Pry as the Rails console
gem 'pry-rails'
gem 'pry-byebug'
gem 'awesome_print', :require => false
gem 'hirb', :require => false
gem 'hirb-unicode', :require => false

# Development tools
group :development do
  gem 'spring'
  gem 'rails-erd'
  gem 'railroady'
  gem 'byebug'
  gem 'better_errors', '~> 2.0.0'
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'meta_request'
  gem 'letter_opener'
  # gem 'guard-livereload', require: false
  # gem 'growl_notify', require: false
end

# RSpec
group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'selenium-webdriver'
  gem 'spring-commands-rspec'
  gem 'shoulda-matchers', require: false
  gem 'rspec-its', require: false
  gem 'rspec-retry', require: false
  gem 'simplecov', '~> 0.9.1', require: false
  gem 'coveralls', require: false
  gem 'capybara-webkit', '>= 1.2.0'
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem 'formulaic'
  gem 'launchy'
  gem 'webmock', require: false
end

# Logger
gem 'remote_syslog_logger'
gem 'rails_stdout_logging', :require => false

# Monitoring Tools
gem 'newrelic_rpm'

# Assets related Gems
gem 'select2-rails', '~> 3.5.9'
