# config/initializers/json_logger.rb
require "json"
require "opentelemetry/sdk"

# STDOUT に出すロガーをベースにする
logger = Logger.new($stdout)

def otel_context_hash
  span = OpenTelemetry::Trace.current_span
  ctx  = span.context
  return {} unless ctx&.valid?

  {
    trace_id: ctx.trace_id.unpack1("H*"),
    span_id:  ctx.span_id.unpack1("H*")
  }
rescue
  {}
end

logger.formatter = proc do |severity, time, progname, msg|
  base = {
    severity: severity,
    timestamp: time.utc.iso8601(6),
    progname: progname,
    message: msg.is_a?(String) ? msg : msg.inspect,
    service: "rails-app"
  }

  log = base.merge(otel_context_hash).compact
  "#{log.to_json}\n"
end

Rails.logger = ActiveSupport::TaggedLogging.new(logger)
