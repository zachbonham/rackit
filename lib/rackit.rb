#!/usr/bin/env ruby

module Rackit
  
  SPACE     = "    "
  MORESPACE = "\t \t"
  VERSION   = IO.read(File.dirname(__FILE__) + '/../VERSION')
  INPUT     = IO.read(File.dirname(__FILE__) + '/../sample.rb')
  
   
  require 'optparse'
  require 'rackit/environment'
  require 'rackit/server'
  require 'rackit/server_builder'
  
  def self.put_command(command, description)
    puts SPACE + command + MORESPACE + description
  end
    
  options = {}
  

  parser = OptionParser.new do | option |
    
    option.banner = 'usage: rackit.rb [--version] [--help] COMMAND [ARGS]'
    
    option.on('-v', '--version', 'Outputs the rackit version') do
      puts "rackit version " + VERSION
    end
    
    option.on('--start', 'start a Rackspace environment') do

      e = instance_eval INPUT
      e.to_s
      
    end
    
    option.on_tail('-h', '--help', 'Shows this message') do
      puts option
      puts "hello"
    end
    
    option.on('-h', '--help', 'Shows this screen') do
      puts option
      
      puts "\n"
      puts 'Common Commands'
      puts "\n"
      put_command('init', 'add Rackspace credentials to user store')
      put_command('start', 'start a Rackspace environment')
      put_command('stop', 'stop a Rackspace environment')
      
    end
    
  end.parse!
  

end