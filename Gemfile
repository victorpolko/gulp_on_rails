source 'https://rubygems.org'
ruby '2.2.3'
gem 'rails', '4.2.4'

# Database
gem 'pg'

# Frontend
gem 'simple_form'
gem 'slim-rails'

# Utils
gem 'paperclip',   '~> 4.3.1'
gem 'russian',     '~> 0.6.0'
gem 'whenever',    require: false

# Delayed Tasks
gem 'sidekiq'
gem 'sinatra', '>= 1.3.0', require: nil, group: [:development, :staging] # Sidekiq monitor

group :development do
  gem 'better_errors'
  gem 'capistrano',        '~> 3.4'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano-sidekiq'
  gem 'foreman'
  gem 'jazz_hands',        github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'letter_opener_web', '~> 1.3.0'
  gem 'quiet_assets',      '~> 1.1'
  gem 'spring'
  gem 'thin'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
end

group :test do
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'database_cleaner'
end

group :production do
  gem 'unicorn'
  gem 'uglifier', '~> 2.7'
  gem 'rails_12factor'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end


