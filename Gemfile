source "https://rubygems.org"
source "https://rails-assets.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "4.1.6"
# Use mysql as the database for Active Record
gem "mysql2"
# Use SCSS for stylesheets
gem "sass-rails", "~> 4.0.3"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Use CoffeeScript for .js.coffee assets and views
gem "coffee-rails", "~> 4.0.0"
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem "therubyracer",  platforms: :ruby

# Use jquery as the JavaScript library
gem "jquery-rails"
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "turbolinks"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.0"
# bundle exec rake doc:rails generates the API under doc/api.
gem "sdoc", "~> 0.4.0",          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem "spring",        group: :development

# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Use unicorn as the app server
# gem "unicorn"

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

# Use debugger
# gem "debugger", group: [:development, :test]

gem "dotenv-rails", group: [:development, :test]

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "letter_opener"
end

group :development, :test do
  gem "rspec-rails"
end

group :production do
  # Fix assets on heroku
  # http://stackoverflow.com/questions/18826604/not-deploying-to-heroku-correctly
  gem "rails_log_stdout",           github: "heroku/rails_log_stdout"
  gem "rails3_serve_static_assets", github: "heroku/rails3_serve_static_assets"

  ###### WARNING:
  # Include 'rails_12factor' gem to enable all platform features
  # See https://devcenter.heroku.com/articles/rails-integration-gems for more information.
  gem "rails_12factor"
  gem "thin", "~> 1.6.1"
end

gem "active_model_serializers"
gem "foundation-rails"
gem "haml-rails"
gem "simple_form"
gem "sorcery"
gem "carrierwave"
gem "mini_magick"
gem "fog"
gem "pg"
gem "kramdown"
gem "angularjs-rails"
gem "delayed_job_active_record"
gem "delayed_job_web"
gem "kaminari"

gem "rails-assets-datetimepicker"
gem "rails-assets-select2"
gem "rails-assets-blueimp-file-upload"
gem "rails-assets-Justified-Gallery"
gem "rails-assets-nprogress"
gem "rails-assets-lightbox2"
gem "rails-assets-lodash"
gem "rails-assets-restangular"
gem "rails-assets-skrollr"
