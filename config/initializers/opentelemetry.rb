# config/initializers/opentelemetry.rb
require 'opentelemetry/sdk'
require 'opentelemetry/exporter/otlp'

OpenTelemetry::SDK.configure do |c|
  c.use 'OpenTelemetry::Instrumentation::Rails'
  c.use 'OpenTelemetry::Instrumentation::ActiveRecord'
  c.use 'OpenTelemetry::Instrumentation::ActiveJob'
  c.use 'OpenTelemetry::Instrumentation::Net::HTTP'

  # OTLP exporter の設定（環境変数で上書きできるよう、最低限にしておく）
  # endpoint は後で環境変数で指定するのでここではデフォルトのまま。
end
