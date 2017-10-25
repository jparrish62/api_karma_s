source 'https://rubygems.org'

gem 'rails', '~> 5.1.2'
gem 'dotenv-rails'
gem 'puma', '~> 3.7'
gem 'rack-jsonp-middleware', '~> 0.0.10', :require => 'rack/jsonp'
gem 'rack-cors', :require => 'rack/cors'
gem 'active_model_serializers', '~> 0.10.6'
gem 'devise', '~> 4.3'
gem 'pry-rails', '~> 0.3.6'
gem 'pry-remote', '~> 0.1.8'
gem 'pundit', '~> 1.1'
gem 'omniauth', '~> 1.6', '>= 1.6.1'
gem 'omniauth-oauth', '~> 1.1'
gem 'omniauth-google-oauth2', '~> 0.4.1'
gem 'google-api-client', '~> 0.9.20', require: 'google/apis/calendar_v3'
gem 'json', '~> 2.0', '>= 2.0.2'
gem 'uglifier', '>= 1.3.0'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'rspec-rails', '~> 3.6'
  gem 'factory_girl_rails', '~> 4.8'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'rspec-collection_matchers'
  gem 'ffaker', '~> 2.6'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :production do
  gem 'pg'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'sqlite3'
end
