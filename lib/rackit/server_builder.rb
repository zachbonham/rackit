
module Rackit
  
  class ServerBuilder

    attr_accessor :connection

    def initialize(connection)
      @connection = connection
    end

    def build(name, opt={})

      p "Building server .." + name

      p opt[:imageId]
      p opt[:flavorId]

      server = @connection.build(name, opt)

      p "server build request for " + name + " has been queued.  It will be available shortly."
      return server
    end

  end
  
end
