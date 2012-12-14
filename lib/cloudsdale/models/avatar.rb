class Avatar
  include DataMapper::Resource

  property :normal,   String
  property :mini,     String
  property :thumb,    String
  property :preview,  String
  property :chat,     String

end