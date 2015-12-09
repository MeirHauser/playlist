class UsersController < ApplicationController
  def create
  	@user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
  	if @user.errors.full_messages.empty?
      session[:user_id] = @user.id
      redirect_to '/songs/index'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/users/new'
    end
  end

  def new
	render 'new'
  end

  def show
  	@user = User.find(params[:id])
  	@songs = Song.joins(:addeds).where("user_id = ?", params[:id]).distinct
  	render 'show'
  end
end
