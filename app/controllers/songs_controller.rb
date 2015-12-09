class SongsController < ApplicationController

  def index
  	@user = User.find(session[:user_id])
  	@songs = Song.all
  	render 'index'
  end

  def show
  	@song = Song.find(params[:id])
  	@users = User.joins(:addeds).where("song_id = ?", params[:id]).distinct
  	render 'show'
  end

  def create
  	@song = Song.create(title: params[:title], artist: params[:artist])
  	if @song.errors.full_messages.empty?
      redirect_to '/songs/index'
    else
      flash[:errors] = @song.errors.full_messages
      redirect_to '/songs/index'
    end
  end
end
