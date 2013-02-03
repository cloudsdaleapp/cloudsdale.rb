class Avatar
  include DataMapper::Resource

  property :normal,   String,   key: true
  property :mini,     String
  property :thumb,    String
  property :preview,  String
  property :chat,     String

end