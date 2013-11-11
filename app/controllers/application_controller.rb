class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :check_post
  
  private
  
  def check_post
    if request.method != "GET" && Rails.env.production?
      render inline: "<h1>No POST requests allowed yet -- we're still working on the authentication</h1>"
    end
  end
end
