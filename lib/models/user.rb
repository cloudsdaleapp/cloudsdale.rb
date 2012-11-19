class User

  include DataMapper::Resource

  ROLES = { normal: 0, donor: 1, moderator: 2, contributor: 3, admin: 4, developer: 5, founder: 6 }

  property :id,                     String,   key: true
  property :name,                   String
  property :email,                  String
  property :skype_name,             String
  property :auth_token,             String
  property :time_zone,              String
  property :role,                   Integer,  default: 0
  property :member_since,           Time
  property :invisible,              Boolean
  property :force_password_change,  Boolean

  has n, :clouds,  through: Resource

end
