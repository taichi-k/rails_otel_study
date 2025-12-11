class HealthController < ApplicationController
  def index
    sleep 0.1
    tracer = OpenTelemetry.tracer_provider.tracer('manual-test')
    tracer.in_span('health-check-manual-span') do |span|
      span.add_event('health endpoint called')
    end
    render json: { status: "ok", time: Time.current }
  end
end
