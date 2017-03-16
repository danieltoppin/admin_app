class Admin::ApplicationController < ApplicationController
	#before_action :authorize
	
	def current_moderator
		@moderator ||= Moderator.find(session[:current_moderator_id]) if session[:current_moderator_id]
		end
	end

	def authorize
		#byebug
		unless :current_moderator_id
			redirect_to '/login', alert: 'Please login to view admin'
		end
end