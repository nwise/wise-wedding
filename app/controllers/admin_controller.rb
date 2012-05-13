class AdminController < ApplicationController
  before_filter :authenticate_user

  layout "admin"
  def index
    
  end

  def authorize_user
    return true if Rails.env.test?
    if current_user.is_admin? 
      true
    else
      flash[:notice] = "You are not authorized to access this page"
      redirect_to admin_url
      return false
    end
  end
  
  def authenticate_user
    authenticate_user! unless Rails.env.test?
  end
  
end
