source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails',  '6.1.4'
gem 'sqlite3', '~> 1.4', '>= 1.4.2'
gem 'image_processing'
gem 'mini_magick'
gem 'active_storage_validations'
gem 'bcrypt'
gem 'faker'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'bootstrap-sass'
gem 'puma'
gem 'sass-rails'
gem 'webpacker'
gem 'turbolinks'
gem 'jbuilder'
gem 'counter_culture'
gem 'ransack'
gem 'psych'
gem 'net-smtp', require: false
gem 'net-pop', require: false
gem 'net-imap', require: false
gem 'bootsnap', require: false
gem 'dotenv-rails'
gem 'rack-cors'
gem 'devise'
gem 'devise_token_auth'
gem 'omniauth', '~> 2.0', '>= 2.0.4'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'capybara'
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-unicorn'
end

group :development do
  gem 'web-console', '~> 3.3', '>= 3.3.1'
  gem 'listen'
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'selenium-webdriver'
  gem 'webdriver'
  gem 'rails-controller-testing'
  gem 'guard'
  gem 'guard-minitest'
end

group :production do
  gem 'unicorn'
end