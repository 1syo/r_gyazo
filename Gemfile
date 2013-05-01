source 'https://rubygems.org'

ruby "2.0.0"

gem 'rails', '4.0.0.rc1'

gem 'jquery-rails'
gem 'haml-rails'
gem 'kaminari'
gem 'quiet_assets'
gem 'dbname', github: '1syo/dbname'
gem 'configatron'
gem 'rails-i18n'
gem 'newrelic_rpm'
gem 'rack-health', require: 'rack/health'
gem 'protected_attributes'
gem 'yaml-erb', require: 'yaml/erb', github: '1syo/yaml-erb', tag: 'v0.0.1'

group :assets do
  gem 'sass-rails', '~> 4.0.0.beta1'
  gem 'coffee-rails', '~> 4.0.0.beta1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  #gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass', github: 'machida/bootstrap-sass', branch: 'master'
end

group :production do
  gem 'thin'
end

group :test, :production do
  gem 'pg'
end

group :test, :development do
  gem 'sqlite3'
  gem 'forgery'
  gem 'capybara', '~> 2.0.3'
  gem 'capybara-webkit'
  gem 'launchy'
  gem 'headless'
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'rails_best_practices', '>= 1.2.0', require: false
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-nav'
  #gem 'pry-coolline'
  gem 'coveralls', require: false
end
