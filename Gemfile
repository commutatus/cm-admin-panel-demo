source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem 'rails', '~>7.0.4'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
# gem 'webpacker', '~> 5.4.3'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'coffee-rails', '~> 5.0.0'
gem 'simple_form', '~> 5.1.0'
# Gems required for keeping code clean.
gem 'rubocop', '~> 1.30.1'
gem 'reek', '~> 6.1.1'
gem 'eslint-rails', '~> 1.3.0'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'font-awesome-rails', '~> 4.7.0.8'
gem "cocoon", '~> 1.2.15'
# gem 'cm-admin', '~> 0.7.6'
gem 'cm-admin', path: '../cm-admin'
gem 'cm-graphql', path: '../template-paging-api'
gem 'cm-cart', path: '../cm-cart'
gem 'cm-pay', path: '../cm-pay'
gem 'cm-action-trail', path: '../cm-action-trail'
gem 'devise', '~> 4.8.1'
gem 'sidekiq', '~> 6.0.7'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.3'
  gem 'spring', '~> 2.1.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'faker'
  gem 'fabrication'
  gem 'graphiql-rails', '~> 1.8.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver', '~> 4.1.0'
  gem 'webdrivers', '~> 5.0.0'
end
