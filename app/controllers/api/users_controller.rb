module Api
    class UsersController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :find_user, except: %i[create index]
      before_action :authorize_request, except: :create

      # GET /users
      def index
        @users = User.all
        render json: @users, status: :ok
      end

      # GET /users/{username}
      def show
        @user ? (render json: @user) : (render json: { errors: 'User not found' })
      end

      # POST /users
      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      # PUT /users/{username}
      def update
        if @user.nil?
          render json: { errors: 'User not found' }, status: :not_found
        elsif !@user.update(user_params)
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      # DELETE /users/{username}
      def destroy
        unless @user&.destroy
          render json: { errors: 'User not found' },
                 status: :not_found
        end
      end

      private

      def find_user
        @user = User.find_by(:username => params[:_username])
      end

      def user_params
        params.permit(:firstname, :lastname, :username, :email, :password, :password_confirmation)
      end
    end
end