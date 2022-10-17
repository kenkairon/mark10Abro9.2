class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters , if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre,:telefono])
  end
  def tengo_permisos?
        if !current_user.publicador?
          redirect_to publications_path, alert: "No tienes permisos para esta acción"
        end
    end
end
