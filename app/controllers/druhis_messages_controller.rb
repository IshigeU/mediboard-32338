class DruhisMessagesController < ApplicationController
  def create
    @druhis_message = DruhisMessage.new(druhis_message_params)
    if @druhis_message.save
      redirect_to "/drug_histries/#{@druhis_message.drug_history.id}"
    else
      @drug_history = @druhis_message.drug_history
      @druhis_messages = @drug_history.druhis_messages
      render "drug_histories/show"
    end
  end

  def destroy
    @drug_history = DrugHistory.find(params[:id])
    @druhis_message = DruhisMessage.find(params[:id])
    @druhis_message.destroy
    redirect_to root_path
  end

  private
  def druhis_message_params
    params.require(:druhis_message).permit(:text).merge(user_id: current_user.id, drug_history_id: params[:drug_history_id])
  end

end
