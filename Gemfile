source "https://rubygems.org"

gem "rails", "~> 8.0.2", ">= 8.0.2.1"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false
gem "faker"
gem "graphql"
gem "sprockets-rails"
gem "devise"
gem "packwerk"
gem "packs-rails"
gem "packwerk-extensions"
gem "sidekiq"

group :development do
  gem "graphiql-rails"
  gem "rubocop"
  gem "rubocop-rails"
end

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end
