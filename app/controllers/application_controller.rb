class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :activate_profiler
  # before_action :authenticate_with_http_digest
  before_action :configure_permitted_parameters, if: :devise_controller?

  def activate_profiler
    ENV['RACK_MINI_PROFILER'] = 'on' if params['pp'] =='disabled'
    ENV['RACK_MINI_PROFILER'] = 'off' if params['pp'] == 'disabled'
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :login])
  end

  def user_is_logged_in
    if !session[:current_user]
        redirect_to new_user_registration_path
    end
  end

  def after_sign_up_path_for(resource)
    stored_location_for(resource) || plantcards_path
  end

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) do |f|
  #     f.permit(file_attributes: [:download_pdf])
  #   end
  # end
end
