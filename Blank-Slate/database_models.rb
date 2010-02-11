=begin

Define DataBase Models:

	Default using MongoMapper
	
	- in each class use
	
	--  include MongoMapper::Document or
	--  include MongoMapper::EmbeddedDocument
	
	Warning
	- MongoMapper has one relationship :one is a little dodgy at current version 0.6??

=end

# EXAMPLE

class Artist
  
include MongoMapper::Document
 
	key :name, String

end
