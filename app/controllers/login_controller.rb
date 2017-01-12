require "instagram"

class LoginController < ApplicationController
  CALLBACK_URL = "https://young-earth-85360.herokuapp.com/login/redirectToProfile"
  Instagram.configure do |config|
    config.client_id = "0fd6dea733ba4cc286b396c9a3fa8b40"
    config.client_secret = "ab4d44aa59e146148720913f94fe39c9"
  end

  def login
    p "on login page"
  end
  #on button click trigger this
  def validatebyinstagram
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  def redirectToProfile
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    session[:access_token] = response.access_token
    p "Session is"
    p response
    redirect_to "/profile/home"
  end
end
