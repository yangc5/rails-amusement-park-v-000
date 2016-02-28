class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:user][:id]
      user = User.find(params[:user][:id])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to 'signin_path'
    end
  end

  def destroy
    unless session[:user_id].nil?
      session.delete :user_id
    end
    redirect_to '/'
  end
end