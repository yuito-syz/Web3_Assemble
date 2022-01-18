source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails',      '6.0.3'
gem 'sqlite3', '~> 1.4', '>= 1.4.2'
gem 'image_processing',           '1.9.3'
gem 'mini_magick',                '4.9.5'
gem 'active_storage_validations', '0.8.2'
gem 'bcrypt', '~> 3.1', '>= 3.1.16'
gem 'faker',                   '2.1.2'
gem 'will_paginate',           '3.1.8'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'bootstrap-sass', '3.4.1'
gem 'puma', '~> 5.5', '>= 5.5.2'
gem 'sass-rails', '5.1.0'
gem 'webpacker',  '4.0.7'
gem 'turbolinks', '5.2.0'
gem 'jbuilder',   '2.9.1'
gem 'counter_culture', '~> 2.0'
gem 'ransack', '~> 2.5'
gem 'psych' , "< 4.0.0"
gem 'net-smtp', require: false
gem 'net-pop', require: false
gem 'net-imap', require: false
gem 'bootsnap', require: false

group :development, :test do
  gem 'byebug',  '11.0.1', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 5.0.0'
  gem 'factory_bot_rails'
  gem 'capybara'
end

group :development do
  gem 'web-console',           '4.0.1'
  gem 'listen', '~> 3.7', '>= 3.7.1'
  gem 'spring',                '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'selenium-webdriver'
  gem 'webdriver', '~> 0.19.0'
  gem 'rails-controller-testing', '1.0.4'
  gem 'guard', '~> 2.18'
  gem 'guard-minitest',           '2.4.6'
end

group :production do
  gem 'unicorn', '~> 5.1'
end

# Windows ではタイムゾーン情報用の tzinfo-data gem を含める必要があります
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]