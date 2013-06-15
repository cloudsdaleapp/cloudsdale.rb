require 'cloudsdale/models/user'
module Cloudsdale; end

module Cloudsdale::Models
  class Session < Base
    property :client_id
    property :user
    coerce_key :user, User
  end
end
