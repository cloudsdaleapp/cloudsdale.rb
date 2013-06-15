require 'faraday'
# We're using hashie for now, but I think DataMapper
# is a good idea in the future in case some consumer of
# the gem does actually want to persist the data or use
# it with some adapter we haven't thought of.  While this
# isn't *impossible* with hashie, it's not ideal.
require 'hashie'
require 'faraday_middleware'
require 'bcrypt'

class Cloudsdale::API

  attr_accessor :auth_token
  attr_accessor :internal_token

  def initialize
    @connection = Faraday.new(
      url: 'http://www.cloudsdale.org',
      headers: { user_agent: 'cloudsdale-ruby', :Accept => 'application/json' }
    ) do |c|
      c.request :json
      c.response :json, :content_type => /\bjson$/
      c.adapter :em_http
    end
  end

  def auth_token=(token)
    @connection.headers['X-Auth-Token'] = token
    @auth_token = token
  end

  def authenticate(app_id, app_secret, username, password, grant_type=:password)
    resp = @connection.post do |req|
      req.path = 'oauth/token'
      req.body = { 
        client_id: app_id,
        client_secret: app_secret,
        password: password,
        identifier: username,
        grant_type: grant_type
      }.to_json
    end
    unless response_has_errors(resp.body)
      token = resp.body['access_token']
      self.auth_token = token
      return token
    end
  end

  # Depending on the options you provide, it'll try to log in
  # using different credentials.  Right now, public API only allows
  # logins using username and password combinations, so that's all
  # I'm going to implement
  def get_session(email, password, &block)
    resp = @connection.post do |req|
      req.headers = { :Accept => 'application/json'}
      req.path = 'v1/sessions'
      req.body = {
        email: email,
        password: password
      }.to_json
    end
    resp.on_complete do
      response_has_errors(resp.body)
      p resp.body
      result = Hashie::Mash.new(resp.body['result'])
      self.auth_token = result.user.auth_token
      block.call(result)
    end
  end

  # Requires internal token.
  def get_session_by_id(user_id)

  end

  # This accepts a hash of options for extensibility, but 
  # currently, the only scheme for user lookup is by ID
  def get_user(options = {}, &block)
    resp = @connection.get do |req|
      req.path = "v1/users/#{options[:id]}.json"
    end
    resp.on_complete do
      response_has_errors(resp.body)
      block.call(resp.body['result'])
    end
  end

  # This accepts a hash of options with either an :id or :shortname
  def get_cloud(options = {}, &block)
    resp = @connection.get do |req|
      req.path "v1/clouds/#{options[:id] || options[:shortname]}.json"
    end
    resp.on_complete do
      response_has_errors(resp.body)
      block.call(resp.body['result'])
    end
  end

  def post_message(cloud_id = nil, content = '', device = 'robot', &block)
    resp = @connection.post do |req|
      req.path = "v1/clouds/#{cloud_id}/chat/messages"
      req.body = {
        client_id: '12345678',
        content: content,
        device: device
      }
    end
    resp.on_complete do
      response_has_errors(resp.body)
      block.call(resp.body['result'])
    end
  end

  private

  def response_has_errors(json)
    errors = json['errors']
    return false if errors.nil? || errors.length == 0

    message = json['flash']['message']
    raise ArgumentError, message
    true
  end
end