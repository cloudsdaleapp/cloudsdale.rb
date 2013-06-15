require 'eventmachine'
require 'faye'
require 'cloudsdale/faye_client'

module Cloudsdale
  class Client

    attr_reader :api
    attr_accessor :username, :password, :connected, :user, :client_id, :client_secret

    # options - A hash containing the options to init with
    #           :username => Username to login with
    #           :password => Password to login with
    def initialize(options = {})
      @username = options[:username]
      @password = options[:password]
      @connected = false
      @api = API.new
      @on_message_callbacks = []
    end

    def is_connected?
      @connected
    end

    def clouds
      user[:clouds]
    end

    # Make sure you're inside an EventMachine run loop!
    def connect
      if !EM.reactor_running?
        raise RuntimeError, 'Client requires EventMachine reactor to run.'
      end

      return nil if is_connected?

      if user.nil?
        api.get_session(@username, @password) do |resp|
          self.user = resp['user'] if !resp.nil?
          connect_faye
        end
      else
        connect_faye
      end

      @connected = true
    end

    def on_message
      @on_message_callbacks << Proc.new
      return self
    end

    def message_received(cloud_id, msg)
      @on_message_callbacks.each do |callback|
        callback.call(cloud_id, msg)
      end
    end

    private

    attr_accessor :api

    def connect_faye
      @faye = FayeClient.new
      @faye.update_subscriptions(@user, self)
    end

  end
end
