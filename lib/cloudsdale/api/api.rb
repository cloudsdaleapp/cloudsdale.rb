require 'faraday'
# We're using hashie for now, but I think DataMapper
# is a good idea in the future in case some consumer of
# the gem does actually want to persist the data or use
# it with some adapter we haven't thought of.  While this
# isn't *impossible* with hashie, it's not ideal.
require 'hashie'
require 'faraday_middleware'



class Cloudsdale::API

  def initialize
    @connection = Faraday.new 'http://www.cloudsdale.org' do |c|
      c.request :json
      c.response :json, :content_type => /\bjson$/

      c.use :instrumentation

      c.adapter :em_http
    end
  end

  # Depending on the options you provide, it'll try to log in
  # using different credentials.  Right now, public API only allows
  # logins using username and password combinations, so that's all
  # I'm going to implement
  def get_session(options = {})
    resp = @connection.post do |req|
      req.headers = { :Accept => 'application/json'}
      req.url 'v1/sessions'
      req.body = options.to_json
    end
    check_response_for_errors resp.body
  end

  private

  def check_response_for_errors(json)
    json
  end
end