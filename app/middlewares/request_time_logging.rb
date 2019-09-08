class RequestTimeLogging
  def initialize(app)
    @app = app
  end

  def call(env)
    start = Time.now
    status, headers, response = @app.call(env)
    elapsed = Time.now - start
    request = Rack::Request.new(env)

    log_response_time(elapsed, request)

    [status, headers, response]
  end

  private

  def log_response_time(elapsed_time, request)
    payload = {
      response_time_secs: elapsed_time,
      path: request.path
    }
    p payload

    # SplunkLogger.log('request.response_time', payload)
  end
end
