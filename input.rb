

require 'rackit'

environment = Environment.new("Development", "dev") do
  
  server  "web",     { :instances => 2, :imageId => 49, :flavorId=>2 }
  server  "worker" , { :instances => 1 , :imageId => 49, :flavorId=>2}
  server  "sql", {:instances => 1, :imageId => 49, :flavorId=>2}
  
end
