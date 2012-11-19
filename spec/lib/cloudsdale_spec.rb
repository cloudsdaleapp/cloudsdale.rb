require_relative './spec_helper'

describe Client do 

  before :each do
    username = ""
    password = ""
    auth_token = ""
    @client = Cloudsdale::Client.new(auth_token, username, password)
  end

  
end