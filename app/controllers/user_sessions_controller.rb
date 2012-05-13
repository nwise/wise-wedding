class UserSessionsController < ApplicationController
  layout 'admin'
  def new
    notice = "You are logged in."
    redirect_to root_url if current_user
  end

end
