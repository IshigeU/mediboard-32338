class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    gon.user = @user
  end

  def edit
    @user = User.find(params[:id])
  end

end
