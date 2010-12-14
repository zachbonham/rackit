

module Rackit
  
  class Environment
    attr_accessor :name, :servers, :shortName
    
    
    #
    # name = environment name. e.g. Development, QA, Staging, Production
    # shortName = dev, qa, stg, prod
    # &block = the block of internal DSL code to evaluate
    #
    def initialize(name, shortName, &block)
  
      @name = name
      @servers = []
      @shortName = shortName
      
      # our environment description will be in the &block
      # totally stole this from http://rubylearning.com/blog/2010/11/30/how-do-i-build-dsls-with-yield-and-instance_eval/
      #
      instance_eval &block
      
    end
    
    
    # add a server role definition to the environment
    # options[:instances] = number of instances of this node type
    # optoins[:imageId] = Rackspace image identifier
    # options[:flavorId] = size of the Rackspace image
    #
    def server(role, options = {})
      
      # using role name for server name, but will
      # need to be something like [environment][image][flavor][role][01]
      # devubu256web01
      #
      
      instances = options[:instances].to_i
      
      for i in 1..instances
        serverName = get_server_name(@shortName, options[:imageId], options[:flavorId], role, i)
        s = Server.new(serverName, role, options)
        @servers << s
      end
      
      
    end

    def to_s
      puts "servers: "
      
      #puts server.attributes[:instances].to_s +  " with " + server.role + " role"
      
      @servers.each { |server| 
          puts server.name
        }
    end
    
    private
    
    # 
    # helper to build up a server name produces a name like 'devubu256web01'
    #
    # environment - short name of the environment (e.g. dev, qa, test, prod)
    # image       - what image are we using?  Ubuntu, Debian, Windows
    # flavor      - what size are we using?  256, 512, 1024
    # role        - the primary role of the server.  (e.g. web, worker, queue, crm)
    # instance_id - the instance id of this server
    def get_server_name(environment, image, flavor, role, id)
    
      sprintf("%s%s%s%s%02d", environment, "ubu", "256", role, id)
      
    end
    
  end
end