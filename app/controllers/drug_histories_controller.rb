class DrugHistoriesController < ApplicationController

  def index
    @drug_histories = DrugHistory.all
  end
  
  def new
    @drug_history = DrugHistory.new
  end

  def show
    @drug_history = DrugHistory.find(params[:id])
  end

  def create
    DrugHistory.create(DrugHistory_parameter)
    redirect_to DrugHistory_path
  end

  def destroy
    @drug_history = DrugHistory.find(params[:id])
    @drug_history.destroy
    redirect_to DrugHistory_path, notice:'削除しました'
  end

  def edit
    @drug_history = DrugHistory.find(params[:id])
  end

  def update
    @drug_history = DrugHistory.find(params[:id])
    if @drug_history.update(DrugHistory_parameter)
      redirect_to DrugHistory_path, notice:'編集しました'
    else
      render 'edit'
    end
  end

  private

  def DrugHistory_parameter
    params.require(:drug_history).permit(:hp_name, :text, :start_time, :user, :height_id, :weight_id, :pressure_id, :wbc_id, :hb_id, :plt_id, :pt_inr_id, :ast_id, :alt_id, :gdp_id, :scr_id, :egfr_id, :cpk_id, :crp_id, :k_id, :hba1c_id)
  end

end