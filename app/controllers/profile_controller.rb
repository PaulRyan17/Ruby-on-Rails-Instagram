require 'instagram'
require 'openssl'

class ProfileController < ApplicationController
  def home
    #if user is authenticated
    if session[:access_token]
      client = Instagram.client(:access_token => session[:access_token])
      p "Client is"
      p client
      @user = client.user
      @images = getUsersImages

      render "/profile/home"
      return
    end
    flash[:notice] = "You are not authenticated"
    redirect_to "/login/login"
  end

  def getUsersImages
    client = Instagram.client(:access_token => session[:access_token])

    #get instagram images
    response = client.user_recent_media

    images = [].concat(response)

    return images
  end

  def logout
    reset_session

    redirect_to "/login/login"
  end
  # any API requests outside of get images must be authorized specially by the user
  # and this requires a special URL in the browser as it is in sandbox mode
  # def getUsersLikedMedia
  #   client = Instagram.client(:access_token => session[:access_token])
  #   #get instagram images
  #   response = client.user_liked_media
  #
  #   likedMedia = [].concat(response)
  #
  #   return likedMedia
  # end


end
