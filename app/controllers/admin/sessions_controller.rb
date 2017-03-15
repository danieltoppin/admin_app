class Admin::SessionsController < ApplicationController
  before_action :authorize, except: [:new, :create]

  def new
  end

  def create
  	@moderator = Moderator.find_by(username: params[:username]).authenticate(params[:password])
  	if @moderator
      session[:current_moderator_id] = @moderator.id
      redirect_to admin_moderators_url, notice: "You have successfully signed in"
      #byebug
    else
      flash[:alert] = 'There was a problem with your username or password'
      render :new
    end
  end

  def destroy
  end
end
