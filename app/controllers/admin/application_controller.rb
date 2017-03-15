class Admin::ApplicationController < ApplicationController
	before_action :authorize
	
	def current_moderator
		@moderator ||= Moderator.find(session[:current_moderator_id]) if session[:current_moderator_id]
	else
		end
	end

	def authorize
		unless current_moderator
			redirect_to '/login', alert: 'Please login to view admin'
		end
	end