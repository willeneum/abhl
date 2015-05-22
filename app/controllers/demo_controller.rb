class DemoController < ApplicationController

	layout false
	
  def index
  	# render here will call to load the 'hello' template view (will not go to the 'hello' controller)
  	# not a redirect; no cookies or session data will be read and loaded
  	#render('hello')
  end

  def hello
  	# render here will call to load the 'index' template view (will not go to the 'index' controller)
  	# not a redirect; no cookies or session data will be read and loaded
  	#render('index')
  end

  def other_hello
  	# redirect_to will be a new request to a specific controller and action
  	# redirect_to can also be populated with an internet address [eg. redirect_to('www.google.ca')]
  	redirect_to(:controller => 'demo', :action => 'index')
  end
end
