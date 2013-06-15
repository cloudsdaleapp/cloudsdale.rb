require 'cloudsdale/models/avatar'
module Cloudsdale; end

module Cloudsdale::Models
  class User < Base
    property :name
    property :email
    property :skype_name
    property :auth_token
    property :time_zone
    property :role
    property :member_since
    property :invisible
    property :force_password_change
    property :reason_for_suspension
    property :suspended_until
    property :is_registered
    property :is_banned
    property :is_member_of_a_cloud
    property :is_transient
    property :has_an_avatar
    property :has_read_tnc
    property :needs_to_confirm_registration
    property :needs_password_change
    property :needs_name_change
    property :needs_email_change
    property :needs_username_change
    property :preferred_status
    property :role
    property :clouds, :transform_with => -> arr { arr.map { |c| Cloud.new(c)}}
    property :bans, :transform_with => -> arr { arr.map { |b| Ban.new(b)}}
    property :avatar
    property :also_known_as
    property :status
    property :username
    property :username_changes_allowed

    coerce_key :avatar, Avatar
  end
end
