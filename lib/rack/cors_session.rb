require 'rack'

module Rack
  class CorsSession
    def initialize(app, kwargs={})
      header_name = 'X-Session-Id'
      @app = app
      @env_key = "HTTP_#{header_name}".upcase.tr('-', '_')
    end
    def call(env)
      env['HTTP_COOKIE'] = "_session_id=#{env[@env_key]}" if env[@env_key]
      @app.call(env)
    end
  end
end
