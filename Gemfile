source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgres as the database
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# Use below version of bcrypt to overcome Windows issues.
gem 'bcrypt', '~> 3.1.11'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Bootstrap
gem 'bootstrap', '~> 4.0.0.beta'
# Jquery-rails
gem 'jquery-rails'
#  Devise is for login authentication
gem 'devise', '~> 4.2'
# Toastr is to auto format the notices/alerts/messages to pop up on top right.
gem 'toastr-rails', '~> 1.0'
# Development testing gem
gem 'dotenv-rails', groups: [:development, :test]
# Shrine gem is for image uploading
gem 'shrine'
# Geocoder gem for Google map
gem 'geocoder', '~> 1.4'
# Jquery gem for datepicker - used to select dates for appointments more easily. SASS gem includes this and helps with CSS.
gem 'jquery-ui-sass-rails'
# Bootstrap timepicker - used to select time for appointments more easily
gem 'bootstrap-timepicker-rails'
# Simple form gem - used to allow time and date picker form inputs
gem 'simple_form'
# Ransack gem used for searching
gem 'ransack', '~> 1.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
