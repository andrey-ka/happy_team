source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Standard
gem 'rails', '~> 7.0.4'
gem 'sprockets-rails'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'jsbundling-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'cssbundling-rails'
gem 'jbuilder'
gem 'bootsnap', require: false

# Additional
gem 'activerecord-session_store'
gem 'devise'
gem 'slim-rails'
gem 'pagy'
gem 'validates_email_format_of'

group :development, :test do
  gem 'dotenv-rails', require: 'dotenv/rails-now'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development do
  gem 'web-console'
  gem 'bullet'
  gem 'spring'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'rails-controller-testing'
  gem 'mocha'
  gem 'shoulda', '~> 4.0'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'rspec-rails'
end
