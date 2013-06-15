module Cloudsdale; end

module Cloudsdale::Models
  class Base < Hashie::Trash
    include Hashie::Extensions::MethodAccess
    include Hashie::Extensions::Coercion

    property :id

    #LIGAF
    def assert_property_exists!(property)

    end
  end
end
