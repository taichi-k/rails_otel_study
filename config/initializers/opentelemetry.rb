# config/initializers/opentelemetry.rb
require 'opentelemetry/sdk'
require 'opentelemetry/exporter/otlp'

OpenTelemetry::SDK.configure do |c|
  # service 名（Grafana 上での表示名）
  c.service_name = ENV.fetch('OTEL_SERVICE_NAME', 'rails-otel-demo')
  c.use_all
end
