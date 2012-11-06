require 'faye'
require 'datamapper'

# The base Cloudsdale module
class Cloudsdale::Module

  attr_accessor :auth_key, :username, :password

  # Creates a new instance of the Cloudsdale module
  #
  # @param [String] The auth key provided by Cloudsdale
  # @param [String] The username the module is to operate under
  # @param [String] The password the modules is to use to operate
  def initialize(auth_key, username, password)
    @auth_key = auth_key
    @username = username
    @password = password
  end

end