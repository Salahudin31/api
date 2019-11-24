class TravellersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_user, except: %i[create index]
  before_action :authorize__traveller_request, except: :create

  # GET /users
  def index
    @travellers = Traveller.all
    render json: @travellers, status: :ok
  end

  # GET /users/{username}
  def show
    @traveller ? (render json: @traveller) : (render json: { errors: 'User not found' })
  end

  # POST /users
  def create
    @traveller = Traveller.new(user_params)
    if @traveller.save
      render json: @traveller, status: :created
    else
      render json: { errors: @traveller.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  def update
    if @traveller.nil?
      render json: { errors: 'User not found' }, status: :not_found
    elsif !@traveller.update(user_params)
      render json: { errors: @traveller.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  def destroy
    unless @traveller&.destroy
      render json: { errors: 'User not found' },
             status: :not_found
    end
  end

  private

  def find_user
    @traveller = Traveller.find_by(:trav_name => params[:_trav_name])
  end

  def user_params
    params.permit(:trav_name, :trav_photo, :trav_email, :trav_phone, :trav_address, :trav_city, :trav_state, :trav_country, :password, :password_confirmation)
  end
end