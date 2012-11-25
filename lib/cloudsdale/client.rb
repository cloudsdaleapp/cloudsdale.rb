# The base Cloudsdale module
module Cloudsdale
  class Client

    attr_reader :api
    attr_accessor :username, :password, :connected, :user

    # options - A hash containing the options to init with
    #           :username => Username to login with
    #           :password => Password to login with
    def initialize(options = {})
      @username = options[:username]
      @password = options[:password]
      @connected = false
      @api = API.new
    end

    def is_connected?
      @connected
    end

    def connect
      if @user.nil?
        @user = @api.get_session({:email => @username,
                                 :password => @password})
      end
      @user
    end

    private

    attr_writer :api

  end
end