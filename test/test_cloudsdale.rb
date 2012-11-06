require 'test/unit'
require 'cloudsdale'

auth_token = ""
username = ""
password = ""

before :each do
  @cloudsdale = Cloudsdale::Module.new(auth_token, username, password)
end

describe Cloudsdale do 
  it "takes three parameters and returns a Module object"
    @cloudsdale.should be_an_instance_of Cloudsdale::Module
  end
end