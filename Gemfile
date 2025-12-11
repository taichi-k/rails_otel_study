source "https://rubygems.org"

ruby "3.3.5"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.0"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# OpenTelemetry core
gem 'opentelemetry-sdk'
gem 'opentelemetry-exporter-otlp'

# Rails / ActiveRecord / ActiveJob / Net::HTTP あたりの自動計装
gem 'opentelemetry-instrumentation-rails'
gem 'opentelemetry-instrumentation-active_record'
gem 'opentelemetry-instrumentation-active_job'
gem 'opentelemetry-instrumentation-net_http'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
end