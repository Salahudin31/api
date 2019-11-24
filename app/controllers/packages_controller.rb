class PackagesController < ApplicationController
	skip_before_action :verify_authenticity_token
  before_action :authorize__traveller_request, except: [:index, :show]
	
	def index
  	@packages = Package.all  
  	render json: @packages, status: :ok 
  end

  def new
  	@package = Package.new   
  end

  def show_image
  	@package = Package.find(params[:id])
  	send_data @package.image, :type => 'image/png',:disposition => 'inline'
  end

  def show
  	@package = Package.find(params[:id])
  	render json: @package, status: :ok
  end  

  def create
  	@package = Package.new(package_params)   
         
    if @package.save
      render json: @package, status: :created
    else
      render json: { errors: @package.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @package.nil?
      render json: { errors: 'Update Success' }, status: :update
    elsif !@package.update(package_params)
      render json: { errors: @package.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
  	@package = Package.find(params[:id])   
    @package.destroy   
    render json: { errors: 'Delete Success' }, status: :destroy
  end

  private   
    def package_params   
    	params.permit(:name,:photo,:banner_photo,:description,:location,:start_date,:end_date,:last_booking_date,:itinerary,:price,:policy,:terms,:featured,:meta_title,:meta_keyword,:meta_description)   
  	end  

end
