require_relative './spec_helper'
require_relative '../../lib/cloudsdale'
require 'json'

describe Cloudsdale::Client do 

  before :each do
    username = ""
    password = ""
    @client = Cloudsdale::Client.new(username: username, password: password)
  end

  it 'can establish a session' do
    json = @client.connect
    json.length.should be > 0
    json['status'].should == 200
  end

  it 'can get a user' do
    json = @client.api.get_user(id: "4f2ad7371f5f9d3ab7004476")
    json.length.should be > 0
    json['result']['name'].should == "Berwyn Codeweaver"
  end

  it 'can get a cloud by id' do
    json = @client.api.get_cloud id: "4eebdb723fddbd514a000056"
    json.length.should be > 0
    json['result']['name'].should == "Programmers"
  end

  it 'can get a cloud by shortname' do
    json = @client.api.get_cloud shortname: 'hammock'
    json.length.should be > 0
    json['result']['name'].should == "Hammock"
  end

  it 'can get the popular clouds' do
    json = @client.api.get_cloud shortname: 'popular'
    json.length.should be > 0
    json['result'].length.should be > 1
  end

  it 'can get the most recent clouds' do
    json = @client.api.get_cloud shortname: 'recent'
    json.length.should be > 0
    json['result'].length.should be > 1
  end

end