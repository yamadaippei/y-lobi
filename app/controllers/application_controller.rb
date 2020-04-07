class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
  end
  
  def set_search
    @search = Group.ransack(params[:q])
    @search_groups = @search.result
  end
end