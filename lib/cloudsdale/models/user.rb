class User
  include DataMapper::Resource

  property :id,                             String,   key: true
  property :name,                           String
  property :email,                          String
  property :skype_name,                     String
  property :auth_token,                     String
  property :time_zone,                      String
  property :role,                           Integer,  default: 0
  property :member_since,                   DateTime
  property :invisible,                      Boolean
  property :force_password_change,          Boolean
  property :reason_for_suspension,          String
  property :suspended_until,                DateTime
  property :is_registered,                  Boolean
  property :is_banned,                      Boolean
  property :is_member_of_a_cloud,           Boolean
  property :is_transient,                   Boolean
  property :has_an_avatar,                  Boolean
  property :has_read_tnc,                   Boolean
  property :needs_to_confirm_registration,  Boolean
  property :needs_password_change,          Boolean
  property :needs_name_change,              Boolean
  property :preferred_status,               Enum[ :offline, :online, :away, :busy ],                                    default: :online
  property :role,                           Enum[ :normal, :donor, :legacy, :associate, :admin, :developer, :founder ], default: :normal

  has n, :also_known_as,  model: String
  has n, :clouds
  has 1, :avatar
  has n, :bans

end
