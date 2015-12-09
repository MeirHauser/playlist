class SessionsController < ApplicationController
  def create
  	@user = User.find_by_email(params[:email])
  	if @user
	  	if @user.password == (params[:password])
	  		session[:user_id] = @user.id
	  		redirect_to "/songs/index"
	  	else
	  		flash[:error] = 'Invalid password'
	  		redirect_to "/users/new"
	  	end
	else
		flash[:error] = 'User does not exist'
		redirect_to "/users/new"
	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:message] = 'Come back soon'
  	redirect_to '/users/new'
  end
end
