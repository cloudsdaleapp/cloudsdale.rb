
require 'restclient'
require 'json'
require 'data_mapper'

# The base Cloudsdale module
class Cloudsdale::Client

  attr_reader :api
  attr_accessor :auth_key, :username, :password, :connected, :user

  def initialize(auth_key, username, password)
    @auth_key = auth_key
    @username = username
    @password = password
    @connected = false
    @api = RestClient::Resource.new('http://www.cloudsdale.org/v1')
  end

  def is_connected?
    @connected
  end

  def connect
    response = @api.post[ 'sessions.json' ] {'token' => @auth_key, 'email' => @username, 'password' => @password}.to_json, { content_type: :json, accept: :json }
    if response.code == 200
      @user = JSON.parse(response.result[:user])
    end
  end

  private

  attr_writer :api

end