class ApplicationController < ActionController::Base
  before_action :authenticate_customer!, except: [:top, :about, :sign_up, :sign_in]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    outfits_path
  end

  def after_sign_out_path_for(resource)
    new_customer_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
