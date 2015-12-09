class AddedsController < ApplicationController
  def create
  	Added.create(user: User.find(session[:user_id]), song: Song.find(params[:song_id]))
  	redirect_to '/songs/index'
  end
end
