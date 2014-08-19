source 'https://rubygems.org'
ruby '2.1.2'
gem 'rails', '4.1.5'
gem 'sqlite3'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development
gem 'devise'
gem 'foundation-rails'
gem 'haml-rails'
gem 'simple_form'

group :development do
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-cucumber'

  gem 'html2haml'
  gem 'rails_layout'

  gem 'pry-rails'
  gem 'pry-rescue'
end


group :development, :test do
  gem 'better_errors'

  gem 'spring-commands-rspec'
  gem "spring-commands-cucumber"
  gem 'quiet_assets'

  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers', require: false

  gem 'cucumber-rails', require: false
  gem 'gherkin', '~> 2.12.2'

  gem 'faker'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end

# Add to darwin group for heroku
# http://www.johnplummer.com/rails/heroku-error-conditional-rbfsevent-gem.html
group :test, :darwin do
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
end

group :production do
  gem 'unicorn'
  gem 'rails_12factor'
  gem 'pg'
end
