class DestinationsController < ApplicationController
	skip_before_action :verify_authenticity_token
  before_action :authorize__traveller_request, except: [:index, :show]

  def index
    @destinations = Destination.all
    render json: {data: @destinations}, status: :ok
  end

  def show
    @destination ? (render json: @destination) : (render json: { errors: 'Destination not found' })
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      render json: @destination, status: :created
    else
      render json: { errors: @destination.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @destination.nil?
      render json: { errors: 'Destination not found' }, status: :not_found
    elsif !@destination.update(destination_params)
      render json: { errors: @destination.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    unless @destination&.destroy
      render json: { errors: 'Destination not found' },
             status: :not_found
    end
  end

  private

  def find_user
    @destination = Destination.find(params[:id])
  end

  def destination_params
    params.permit(:title, :description, :meta_title, :meta_keyword, :meta_description)
  end
end