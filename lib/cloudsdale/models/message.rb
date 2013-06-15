require 'cloudsdale/models/user'

module Cloudsdale; end

module Cloudsdale::Models
  class Message < Base
    property :content
    property :client_id
    property :drops
    property :timestamp, :transform_with => -> str { DateTime.parse(str) }
    property :author
    property :author_id
    property :device

    coerce_key :author, User
  end
end