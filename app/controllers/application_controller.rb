class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :age_id, :sex_id, :prefecture_id, :shop_name, :shop_info, :content, :address, :job_id, :image, :latitude, :longitude])
  end
end