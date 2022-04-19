class ApplicationController < ActionController::API
    include DeviseTokenAuth::Concerns::SetUserByToken
    # before_action :authenticate_user!, unless: :devise_controller?
    before_action :configure_permitted_parameters, if: :devise_controller?
    # skip_before_action :verify_authenticity_token
    
    def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
