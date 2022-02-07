class Users::TwoFactorAuthsController < ApplicationController
    before_action :authenticate_user!
  
    def show; end
  
    def create
      if permitted_otp_code[:otp_code]
        current_user.validate_and_consume_otp!(permitted_otp_code[:otp_code])
        current_user.otp_required_for_login = true
        current_user.save!
      else
        unless current_user.otp_secret
          current_user.otp_secret = User.generate_otp_secret(32)
          current_user.save!
        end
      end
  
      render :show
    end
  
    def permitted_otp_code
      params.permit(:otp_code)
    end
end