
#  Setup Enviroment for Testing:

#  -  Cucumber
#  -  Rspec
#  -  Rack/Test - this may be built in to sinatra now...visit sinatra doc...
#  -  webrat

######################################


app_file = File.join(File.dirname(__FILE__), *%w[.. .. start.rb])
require app_file
# Force the application name because polyglot breaks the auto-detection logic.
Sinatra::Application.app_file = app_file  
  
require 'cucumber/formatter/unicode'
require 'spec/expectations'
require 'rack/test'
require 'webrat'


Webrat.configure do |config|
  config.mode = :rack
end

class MyWorld
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers
  

  Webrat::Methods.delegate_to_session :response_code, :response_body

  def app
    Sinatra::Application
  end
end

World{MyWorld.new}