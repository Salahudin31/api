class Api::SubscribesController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authorize_request
	
	def index
  	@subscribes = Subscribe.all  
  	render json: @subscribes, status: :ok 
  end

  def new
  	@subscribe = Subscribe.new   
  end
  
  def show
  	@subscribe = Subscribe.find(params[:id])
  	render json: @subscribe, status: :ok
  end  

  def create
  	@subscribe = Subscribe.new(subscribe_params)   
         
    if @subscribe.save
      render json: @subscribe, status: :created
    else
      render json: { errors: @subscribe.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @subscribe.nil?
      render json: { errors: 'Update Success' }, status: :update
    elsif !@subscribe.update(subscribe_params)
      render json: { errors: @subscribe.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
  	@subscribe = Subscribe.find(params[:id])   
    @subscribe.destroy   
    render json: { errors: 'Delete Success' }, status: :destroy
  end

  private   
    def subscribe_params   
    	params.permit(:email,:date,:date_time,:active)   
  	end  
end
