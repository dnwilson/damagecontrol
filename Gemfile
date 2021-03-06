source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 4.0.2'

gem 'thin'
gem 'pg'
gem 'pg_search'
gem 'devise', '~> 3.2.2'
gem 'paperclip', '~> 4.1'
gem 'actionpack-page_caching'
gem 'actionpack-action_caching'

gem 'rmagick', require: false
gem 'carrierwave'
gem 'activemerchant'
gem 'auto_html'
gem 'asset_sync'
gem 'activeadmin',  github: 'gregbell/active_admin'

# Use SCSS for stylesheets
gem 'rails_layout'
gem 'sass-rails', '~> 4.0.0'
gem 'bootstrap-sass', '~> 3.1.0'
gem 'bootstrap_form'
gem 'country_select'
gem 'font-awesome-rails'
gem "jquery-fileupload-rails"
gem 'jquery-colorbox-rails'
gem 'mini_magick'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
   gem 'rspec-rails'
   gem 'guard-rspec'
   gem 'spork-rails'
   gem 'guard-spork'
   gem 'childprocess'
   gem 'forgery'
   gem 'factory_girl_rails'
   gem 'shoulda-matchers'
end

group :development do
   gem 'better_errors'
   gem 'binding_of_caller'
   gem 'meta_request'
   gem 'rack-mini-profiler'
   gem 'bullet'
end

group :test do
   gem 'capybara', '~> 2.1'
   # gem 'growl'
end

group :production do
  gem "rails_12factor"
  gem "unicorn"
  gem "newrelic_rpm"
  gem "dalli"
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
