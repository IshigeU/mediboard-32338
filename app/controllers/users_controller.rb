class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    gon.user = @user
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      @users = User.all
      render 'users/index'
    end
  end

  private

  # ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :email, :age_id, :sex_id, :prefecture_id, :shop_name, :shop_info, :content, :address, :job_id, :image, :latitude, :longitude, :user_id)
  end

end
