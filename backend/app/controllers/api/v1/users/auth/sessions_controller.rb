class Api::V1::Users::Auth::SessionsController < DeviseTokenAuth::SessionsController
    def guest_sign_in
      #@resource = User.guest
      #@token = @resource.create_token
      #@resource.save!
      #render_create_success

      user = User.guest
      render json: { name: user.name, email: user.email, password: user.password }
    end
end