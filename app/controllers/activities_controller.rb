class ActivitiesController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authorize__traveller_request, except: [:index, :show]
	
	def index
  	@activities = Activity.all  
  	render json: @activities, status: :ok 
  end

  def new
  	@activity = Activity.new   
  end

  def show_image
  	@activity = Activity.find(params[:id])
  	send_data @activity.image, :type => 'image/png',:disposition => 'inline'
  end

  def show
  	@activity = Activity.find(params[:id])
  	render json: @activity, status: :ok
  end  

  def create
  	@activity = Activity.new(activity_params)   
         
    if @activity.save
      render json: @activity, status: :created
    else
      render json: { errors: @activity.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @activity.nil?
      render json: { errors: 'Update Success' }, status: :update
    elsif !@activity.update(activity_params)
      render json: { errors: @activity.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
  	@activity = Activity.find(params[:id])   
    @activity.destroy   
    render json: { errors: 'Delete Success' }, status: :destroy
  end

  private   
    def activity_params   
    	params.permit(:name,:description,:short_description,:photo,:banner_photo,:meta_title,:meta_keyword,:meta_description)   
  	end  
end