source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'mysql2'
gem 'jquery-rails'
gem 'nokogiri'
gem 'capybara'
gem 'capybara-webkit'
gem 'newrelic_rpm'
gem 'rabl'
gem 'twitter-bootstrap-rails'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem "execjs"
  gem "therubyracer", :require => 'v8'
  gem 'headless'
end

group :development do
  gem 'bullet'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test, :development do
  gem 'capistrano'
  gem 'rvm-capistrano'
  gem "rspec-rails", "~> 2.0"
  gem "factory_girl_rails", "~> 4.0"
  gem 'rake'
  gem 'thin'
end
