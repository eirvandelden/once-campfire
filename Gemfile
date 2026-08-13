source "https://gem.coop"

ruby file: ".ruby-version"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Rails
gem "rails", "~> 8.1"
gem "ostruct"
gem "benchmark"
gem "connection_pool", "~> 2.5"

# Drivers
gem "sqlite3"
gem "redis", "~> 5.4"

# Deployment
gem "kamal", require: false
gem "puma", "~> 7.2"

# Jobs
gem "resque", "~> 2.7.0"
gem "resque-pool", "~> 0.7.1"

# Assets
gem "propshaft", github: "rails/propshaft"
gem "importmap-rails", github: "rails/importmap-rails"

# Hotwire
gem "turbo-rails", github: "hotwired/turbo-rails"
gem "stimulus-rails"

# Media handling
gem "image_processing", ">= 1.2"
gem "ruby-vips"

# Telemetry
gem "sentry-ruby"
gem "sentry-rails"
gem "exception_notification", ">= 5.0"
gem "exception_notification-campfire-once", github: "eirvandelden/exception_notification-campfire-once"

# Other
gem "bcrypt"
gem "web-push"
gem "rqrcode"
gem "rails_autolink"
gem "geared_pagination"
gem "jbuilder"
gem "net-http-persistent"
gem "kredis"
gem "platform_agent"
gem "thruster"

group :development, :test do
  gem "debug"
  gem "rubocop-rails-omakase", require: false
  gem "faker", require: false
  gem "brakeman", require: false
end

group :test do
  gem "minitest", "~> 5.25"
  gem "capybara"
  gem "mocha"
  gem "selenium-webdriver"
  gem "webmock", require: false
end
