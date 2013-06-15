require 'cloudsdale/models/avatar'
require 'cloudsdale/models/chat'

module Cloudsdale; end

module Cloudsdale::Models
  class Cloud < Base
    property :name
    property :short_name
    property :description
    property :created_at
    property :rules
    property :hidden
    property :member_count
    property :drop_count
    property :short_nam
    property :is_transient
    property :owner_id

    property :user_ids
    property :users, :transform_with => -> arr { arr.map { |u| User.new(u)}}
    
    property :moderator_ids
    property :moderators, :transform_with => -> arr { arr.map { |u| User.new(u)}}
    property :avatar
    property :chat

    coerce_key :avatar, Avatar
    coerce_key :chat, Chat
  end
end
