class HealthController < ApplicationController
  def index
    tracer = OpenTelemetry.tracer_provider.tracer('manual-test')
    tracer.in_span('health-check-manual-span') do |span|
      sleep 0.1
      span.add_event('health endpoint called')
    end
    tracer.in_span("call_external_api") do |_span|
      # ダミーとして sleep や HTTP クライアントを呼ぶ
      sleep 0.2
    end
    tracer.in_span("call_external_api_another") do |_span|
      # ダミーとして sleep や HTTP クライアントを呼ぶ
      sleep 0.5
    end
    render json: { status: "ok", time: Time.current }
  end
end
