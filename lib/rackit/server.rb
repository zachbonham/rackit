

module Rackit
  
  class Server
    attr_accessor :name, :role, :attributes
  
    def initialize(name, role, attributes = {})

      @name = name
      @role = role
      @attributes = attributes
    end
  end
end
