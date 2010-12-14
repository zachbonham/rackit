
Description
===========
	
Rackit is comprised of two parts:
		
1. The Ruby based internal DSL to describe a computing environment
2. The Ruby based command line interface into the [Rackspace](http://rackspacecloud.com) Ruby Cloud Server API.  
	
This is a project for me to get some practical experience with Ruby - I am not looking to compete against the likes of [Chef](http://www.opscode.com), I'm just learning Ruby.

Thanks!
Z


Installation
============

This source is available on [Github](http://github.com/zachbonham/rackit) and the gem is available on [Gemcutter](http://gemcutter.org/).  To install it, do

	gem sources -a http://gemcutter.org/ (Newer Ruby Gems have this already)

	sudo gem install rackit

Example
=======

Initialize Rackit Environment
-----------------------------

	ruby rackit.rb init
	
Describe the Computing Environment with Rackit DSL
-------

	require 'rackit'

	environment = Environment.new("Development", "dev") do
  
  		server  "web",     {:instances => 2, :imageId => 49, :flavorId => 2 }
  		server  "worker" , {:instances => 1, :imageId => 49, :flavorId => 2 }
  		server  "sql",     {:instances => 1, :imageId => 49, :flavorId => 2 }
  
	end


Start the Rackspace Environment
----

	ruby rackit.rb start dev


Stop the Rackspace Environment
----

	ruby rackit.rb stop dev


Known Issues
============

1. rackit.rb init command doesn't work :)
2. rackit.rb start command doesn't work :)
3. rackit.rb stop command doesn't work :)


The DSL does work somewhat ...work in progress! :)

Thanks,

Z