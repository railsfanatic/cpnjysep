class IgController < ApplicationController
  def auth
    redirect_to Instagram.authorize_url(:redirect_uri => ig_callback_url)
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => ig_callback_url)
    Settings.find_or_create_by(name: "instagram_access_token").update(value: response.access_token)
    redirect_to root_url
  end
end
