class Api::V1::UserTokenController < ApplicationController
    rescue_from UserAuth.not_found_exception_class, with: :not_found

    before_action :delete_cookie
    before_action :authenticate, only: [:create]

    def create
        cookies[token_access_key] = cookie_token
        render json: {
          exp: auth.payload[:exp],
          user: entity.my_json
        }
    end

    def destroy
        head(:ok)
    end
    
    private
        def auth
            @_auth ||= UserAuth::AuthToken.new(payload: { sub: entity.id })
        end

        def entity
            @_entity ||= User.find_activated(auth_params[:email])
        end

        def auth_params
            params.require(:auth).permit(:email, :password)
        end

        def cookie_token
            {
              value: auth.token,
              expires: Time.at(auth.payload[:exp]),
              secure: Rails.env.production?,
              http_only: true
            }
        end

        def authenticate
            unless entity.present? && entity.authenticate(auth_params[:password])
              raise UserAuth.not_found_exception_class
            end
        end

        def not_found
            head(:not_found)
        end
end
