module DeviseTokenAuth
    class SessionsController < DeviseTokenAuth::ApplicationController
      before_action :set_user_by_token, only: [:destroy]
      after_action :reset_session, only: [:destroy]
  
      def new
        render_new_error
      end
  
      def create
        # Check
        field = (resource_params.keys.map(&:to_sym) & resource_class.authentication_keys).first
  
        @resource = nil
        if field
          q_value = get_case_insensitive_field_from_resource_params(field)
  
          @resource = find_resource(field, q_value)
        end
  
        if @resource && valid_params?(field, q_value) && (!@resource.respond_to?(:active_for_authentication?) || @resource.active_for_authentication?)
          valid_password = @resource.valid_password?(resource_params[:password])
          if (@resource.respond_to?(:valid_for_authentication?) && !@resource.valid_for_authentication? { valid_password }) || !valid_password
            return render_create_error_bad_credentials
          end

          # 2要素認証機能が有効な場合
          if @resource.otp_required_for_login
            # FE側からotp_codeが送られていて、かつそのotp_codeで認証した結果、認証に成功した場合
            if resource_params[:otp_code].present? && @resource.validate_and_consume_otp!(resource_params[:otp_code])
              @token = @resource.create_token
              @resource.save
  
              sign_in(:user, @resource, store: false, bypass: false)
  
              yield @resource if block_given?
  
              return render_create_success
            else
              # FE側からotp_codeが送られていないか、認証に失敗した場合は、例外をレンダリング
              return render_create_error_need_to_two_factor_auth
            end
          end

          @token = @resource.create_token
          @resource.save
  
          sign_in(:user, @resource, store: false, bypass: false)
  
          yield @resource if block_given?
  
          render_create_success
        elsif @resource && !(!@resource.respond_to?(:active_for_authentication?) || @resource.active_for_authentication?)
          if @resource.respond_to?(:locked_at) && @resource.locked_at
            render_create_error_account_locked
          else
            render_create_error_not_confirmed
          end
        else
          render_create_error_bad_credentials
        end
      end
  
      def destroy
        # remove auth instance variables so that after_action does not run
        user = remove_instance_variable(:@resource) if @resource
        client = @token.client
        @token.clear!
  
        if user && client && user.tokens[client]
          user.tokens.delete(client)
          user.save!
  
          yield user if block_given?
  
          render_destroy_success
        else
          render_destroy_error
        end
      end
  
      protected
  
      def valid_params?(key, val)
        resource_params[:password] && key && val
      end
  
      def get_auth_params
        auth_key = nil
        auth_val = nil
  
        # iterate thru allowed auth keys, use first found
        resource_class.authentication_keys.each do |k|
          if resource_params[k]
            auth_val = resource_params[k]
            auth_key = k
            break
          end
        end
  
        # honor devise configuration for case_insensitive_keys
        if resource_class.case_insensitive_keys.include?(auth_key)
          auth_val.downcase!
        end
  
        { key: auth_key, val: auth_val }
      end
  
      def render_new_error
        render_error(405, I18n.t('devise_token_auth.sessions.not_supported'))
      end
  
      def render_create_success
        render json: {
          data: resource_data(resource_json: @resource.token_validation_response)
        }
      end
  
      def render_create_error_not_confirmed
        render_error(401, I18n.t('devise_token_auth.sessions.not_confirmed', email: @resource.email))
      end
  
      def render_create_error_account_locked
        render_error(401, I18n.t('devise.mailer.unlock_instructions.account_lock_msg'))
      end
  
      def render_create_error_bad_credentials
        render_error(401, I18n.t('devise_token_auth.sessions.bad_credentials'))
      end
  
      def render_destroy_success
        render json: {
          success:true
        }, status: 200
      end
  
      def render_destroy_error
        render_error(404, I18n.t('devise_token_auth.sessions.user_not_found'))
      end

      # 2要素認証が必要または2要素認証に失敗した場合にレンダリングされる
      def render_create_error_need_to_two_factor_auth
        render_error(401, I18n.t('devise_token_auth.sessions.bad_credentials'), { two_factor_auth: true })
      end
  
      private
  
      def resource_params
        params.permit(*params_for_resource(:sign_in))
      end
    end
  end