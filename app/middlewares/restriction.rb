class Restriction
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    allowed?(request) ? @app.call(env) : [403, {}, ['Hello']]
  end


  def allowed?(request)
    request.path != '/not_allowed'
  end
end
