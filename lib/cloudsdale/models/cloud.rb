class Cloud

  include DataMapper::Resource

  property :id,             String,   key: true
  property :name,           String
  property :description,    String
  property :created_at,     DateTime
  property :rules,          String
  property :hidden,         Boolean
  property :member_count,   Integer
  property :drop_count,     Integer
  property :short_name,     String
  property :is_transient,   Boolean
  property :owner_id,       String

  has n, :users
  has n, :moderators, User
  has 1, :avatar
  has 1, :chat

end