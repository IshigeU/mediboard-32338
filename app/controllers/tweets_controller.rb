class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    @users = User.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path(@tweet)
    else
      render :new
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end

  def show
    @tweet = Tweet.find(params[:id])
    @message = Message.new
    @messages = @tweet.messages.includes(:user)
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweet_path
    else
      render :edit
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
    unless current_user.id == @tweet.user.id
      redirect_to action: :index
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text, :title, :image).merge(user_id: current_user.id)
  end
end
