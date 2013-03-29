source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'jquery-rails'
gem 'haml-rails'
gem 'kaminari'
gem 'quiet_assets'
gem 'dbname', :git => 'git://github.com/1syo/dbname.git'
gem 'configatron'
gem 'rails-i18n'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  #gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass', :git => "git://github.com/machida/bootstrap-sass.git", branch: 'master'
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
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'
  gem 'headless'
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'rails_best_practices', '>= 1.2.0', :require => false
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'pry-coolline'
end
