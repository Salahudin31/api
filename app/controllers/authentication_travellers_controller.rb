class AuthenticationTravellersController < ApplicationController
  skip_before_action :verify_authenticity_token

  # POST /auth/login
  def login
    @traveller = Traveller.find_by(:trav_email => params[:trav_email])
    if @traveller&.authenticate(params[:password])
      token = JsonWebToken.encode(trav_user_id: @traveller.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                 trav_name: @traveller.trav_name }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def registration
    @traveller = Traveller.new(registration_params)
     if @traveller.save
        @traveller = Traveller.find_by(:trav_email => params[:trav_email])
      if @traveller&.authenticate(params[:password])
        token = JsonWebToken.encode(trav_user_id: @traveller.id)
        time = Time.now + 24.hours.to_i
        render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                 trav_name: @traveller.trav_name }, status: :ok
      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
    else
      render json: { errors: @traveller.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

    def login_params
      params.permit(:trav_email, :password)
    end

    def registration_params
      params.permit(:trav_name, :trav_email, :trav_phone, :trav_address, :trav_city, :trav_state, :trav_country, :password, :password_confirmation)
    end
end