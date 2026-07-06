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
gem "puma", "~> 6.6"

# Jobs
gem "resque", "~> 2.7.0"
gem "resque-pool", "~> 0.7.1"

# Assets
gem "propshaft", github: "rails/propshaft", ref: "e49a9de659ff27462015e54dd832e86e762a6ddc"
gem "importmap-rails", github: "rails/importmap-rails", ref: "51c1a531327fc04ed4552bb0fd523eb43561b817"

# Hotwire
gem "turbo-rails", github: "hotwired/turbo-rails", ref: "30cd8fcc6f82c1ad4edd1ed6069ba878f21f02b3"
gem "stimulus-rails"

# Media handling
gem "image_processing", ">= 1.2"
gem "ruby-vips"

# Telemetry
gem "sentry-ruby"
gem "sentry-rails"

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
