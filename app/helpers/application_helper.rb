module ApplicationHelper
	def _error_messages_for(user=nil)
		render(partial: 'layouts/error_messages', user: user) unless user.blank?
	end
	
end
