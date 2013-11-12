class SessionsController < ApplicationController
  def create
    @auth = env["omniauth.auth"]
  end
end