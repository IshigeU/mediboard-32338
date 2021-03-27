class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
  end

  def create

  end
end
