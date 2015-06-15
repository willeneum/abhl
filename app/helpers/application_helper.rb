module ApplicationHelper
	def error_messages_for(err)
		render(:partial => 'application/error_messages', :locals => {:object => err})
	end
end
