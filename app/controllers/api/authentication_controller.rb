module Api
    class AuthenticationController < ApplicationController
      skip_before_action :verify_authenticity_token

      # POST /auth/login
      def login
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
          token = JsonWebToken.encode(user_id: @user.id)
          time = Time.now + 24.hours.to_i
          render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.username }, status: :ok
        else
          render json: { error: 'unauthorized' }, status: :unauthorized
        end
      end

      def registration
        @user = User.new(registration_params)
         if @user.save
            @user = User.find_by_email(params[:email])
          if @user&.authenticate(params[:password])
            token = JsonWebToken.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            render json: token, status: :create
          else
            render json: { error: 'unauthorized' }, status: :unauthorized
          end
        else
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      private

        def login_params
          params.permit(:email, :password)
        end

        def registration_params
          params.permit(:firstname, :lastname, :username, :email, :password, :password_confirmation)
        end
    end
end