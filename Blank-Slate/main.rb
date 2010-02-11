=begin

This is the main sinatra program:

- Helpers
- Before - used mainly to configure headers...this code is run before all blocks
- Custom Methods - for use in routes
- Routes - The heart of a sinatra app

=end

#  Helpers
#########

helpers do
 # e.g. include Sinatra::Authorization
end

before do 
 # you might check your cookies or sessions here
end  


#  Custom Methods
##################




#  Routes
#########

get '/' do
	
	@hello = "if fancy a chat add us on Twitter, Linkedin or github"
	haml :about, :layout => :'layouts/application'
end
	


