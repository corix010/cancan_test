class ApplicationController < ActionController::Base
  protect_from_forgery

  enable_authorization do |exception|
    redirect_to root_url, :alert => 'You have not enough permission to access this potion of the site!'
  end

  def current_user
    User.all[1]
  end

end
