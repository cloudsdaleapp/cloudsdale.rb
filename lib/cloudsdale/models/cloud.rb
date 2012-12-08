class Cloud

  include DataMapper::Resource

  property :id,             String,   key: true
  property :name,           String
  property :description,    String
  property :created_at,     Time
  property :rules,          String
  property :hidden,         Boolean
  property :member_count,   Integer
  property :drop_count,     Integer
  property :short_name,     String
  property :is_transient,   Boolean
  property :owner_id,       String
  property :user_ids,       List
  property :moderator_ids,  List

  has 1, :avatar, 'Avatar'
  has 1, :chat,   'Chat'

end