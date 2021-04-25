class DrugHistoriesController < ApplicationController

  def index
    @drug_histories = DrugHistory.all
  end
  
  def new
    @drug_history = DrugHistory.new
  end

  def show
    @drug_history = DrugHistory.find(params[:id])
    @druhis_message = DruhisMessage.new
    @druhis_messages = @drug_history.druhis_messages.includes(:user)
  end

  def create
    @drug_history = DrugHistory.new(drughistory_params)
    if @drug_history.save
      redirect_to root_path(@drug_history.id)
    else
      render :new
    end
  end

  def destroy
    drug_history = DrugHistory.find(params[:id])
    drug_history.destroy
    redirect_to drug_histories_path, notice:'削除しました'
  end

  def edit
    @drug_history = DrugHistory.find(params[:id])
  end

  def update
    @drug_history = DrugHistory.find(params[:id])
    if @drug_history.update(drughistory_params)
      redirect_to drug_history_path, notice:'編集しました'
    else
      render 'edit'
    end
  end

  private

  def drughistory_params
    params.require(:drug_history).permit(:hp_name, :text, :start_time, :height_id, :weight_id, :pressure_id, :wbc_id, :hb_id, :plt_id, :pt_inr_id, :ast_id, :alt_id, :gdp_id, :scr_id, :egfr_id, :cpk_id, :crp_id, :k_id, :hba1c_id).merge(user_id: current_user.id)
  end

end