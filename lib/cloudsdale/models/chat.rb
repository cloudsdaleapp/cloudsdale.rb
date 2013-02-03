class Chat

  include DataMapper::Resource

  property :last_message_at,  DateTime,   key: true

end