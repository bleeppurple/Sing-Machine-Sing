=begin

File Contents:

	Required Gems
	Require Custom libs - saved in libs folder
	Sinatra enviroment setup
	Compass enviroment setup
	Initialize Session
	Register Mime Types
	DATABASE setup - default mongodb (make sure you start mongo from command line ./mongodb)
	
	load main sinatra app
	
	-- NOTES
	
	Current Setup
	
	FrameWork
	---------
	Sinatra - You should know what this is!!! its a simple DSL framework
	Rack - Sinatra works nicely with Rack middle-wear so you can use any Rack functionality
	
	UI
	-- 
	compass - HAML, SASS framework
	HAML - HTML replacement markup language
	SASS - CSS replacement language
	
	DATABASE
	--------
	
	MongoDB - Document database similar to couch DB
	Mongo Mapper - ORM Database mapper, similar to Active Record
	Gridfs - Database File protocol thingy, save files directly in the database (in this case mongo)
	
		NOTES
		Make sure you start .\mongod and that the database is running before starting sinatra app
		also make sure you download the database utility (linux, windows or mac) and the ruby library so you can access it in sinatra
	
	LIBS/EXTENSION
	--------------
	Device Atlas - Ruby libray to work with The Device atlas (JSON Database)
					--  Warning --
					    You need to buy a license from Device atlas and download its json device database
					
	Device Profiler - Custom Lib, Mapper for Device Atlas API
	Authorization - Basic Auth example from sinatra
	Render Partials - Helper to render Partials
	
	Testing
	-------
	
	Cucumber - BDD testing goodness				
	Rspec - An essential partner to cucumber
	Rack::Test - Test built in to sinatra
	
		-- Setup 
		See features directory
		features/support/env.rb contains config settings for all of these
		
		make sure you have rack-test, cucumber and rspec gems installed
		
		-- Running Cucumber
		-  name your tests as a feature file and place them in the features directory
			e.g login.feature
		-  you run cucumber from app directory (where main.rb is located)
			e.g $  cucumber feature/login.feature
		
		-- Specs
		-  saved in the specs directory
			
		

	Alternatives
	------------
	
	see below for uses of active record and datamapper

=end
# Required Gems
############

require 'rubygems'  # load before sinatra
require 'compass'   # load before sinatra
require 'json'      # must keep to read device profiles
require 'sinatra'
require 'haml'
require 'sass'

## custom libs
# e.g
# require 'lib/grip'


#  Setting up Sinatra Enviroment Variables
###########################

set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, 'views'
set :public, 'public'
set :static, 'enable'

#  Configure Compass Enviroment Variables
############################

##  Setup Compass config options file path

configure do
  Compass.configuration.parse(File.join(Sinatra::Application.root, 'config.rb'))
end
 
##  Setup SASS stylesheets routes for use in Sinatra

##  NOTE 
##  at a minimum the main sass file must reside within the views directory
##  we create /views/stylesheets where all our sass files can safely reside

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"stylesheets/#{params[:name]}",Compass.sass_engine_options)
end



#  Setting up Sessions --examples
##############

use Rack::Session::Cookie, :secret => 'bleeppurplebleeppurle'

#  Mime types --examples
##########

mime :mp3, 'audio/mpeg'

=begin -- example configs

#  Setup Database 
#############

##  MongoDB

 MongoMapper.connection = Mongo::Connection.new("localhost")
 MongoMapper.database = "uzzFM"
 
 ##  load models and test data if needed
 
 load 'database_models.rb'
=end

=begin

#  Alternative Database settings
################################


##  NOTE also need to require gems 
##		- require 'activerecord'
##		- require 'dm-core'

##  Active Record Config

	ActiveRecord::Base.establish_connection(
		:adapter => 'sqlite3',
		:dbfile =>  'sinatra_application.sqlite3.db'
		)
	
##  Data Mapper Config

	DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/config/db/database.db")

=end

# Load Main File

load 'main.rb'
