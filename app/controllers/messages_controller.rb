class MessagesController < ApplicationController
  #def new
   # @messages = Message.all
   # @message = Message.new
  #end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to "/tweets/#{@message.tweet.id}"
    else
      @tweet = @message.tweet
      @messages = @tweet.messages
      render "tweets/show"
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to "/tweets/#{@message.tweet.id}"
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
