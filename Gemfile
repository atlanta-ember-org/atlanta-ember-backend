source 'https://rubygems.org'

ruby "2.5.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.5'

# use postgres database
gem 'pg'

# really!  Order dependancy in the gemfile!?!?
gem 'dotenv-rails', group: [:test, :development]

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# For a little HTTP help
gem 'faraday'

gem 'pry'
gem 'lazy_doc'
gem 'sidekiq'
gem 'foreman'
gem 'active_model_serializers'
gem 'rack-cors', :require => 'rack/cors'
gem 'rails_12factor', group: :production

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'vcr'
  gem 'database_cleaner'
end

group :test do
  gem 'webmock'
end
