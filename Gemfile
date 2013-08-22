source 'https://rubygems.org'
ruby '1.9.3'
gem 'rails', '3.2.13'
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'angular-ui-bootstrap-rails'
  gem 'angularjs-rails'
  gem 'angularjs-rails-resource', '~> 0.2.0'
end
gem 'jquery-rails'
gem 'bootstrap-sass', :git => 'git://github.com/thomas-mcdonald/bootstrap-sass.git', :branch => '3'
gem 'devise'
gem 'figaro'
gem 'pg'
gem 'simple_form'
gem 'thin'
gem 'gon'
group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :rbx]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'quiet_assets'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
end
