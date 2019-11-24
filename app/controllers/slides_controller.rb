class SlidesController < ApplicationController
	skip_before_action :verify_authenticity_token
  before_action :authorize__traveller_request, except: [:index, :show]
	
	def index
  	@slides = Slide.all  
  	render json: @slides, status: :ok 
  end

  def new
  	@slide = Slide.new   
  end

  def show_image
  	@slide = Slide.find(params[:id])
  	send_data @slide.image, :type => 'image/png',:disposition => 'inline'
  end

  def show
  	@slide = Slide.find(params[:id])
  	render json: @slide, status: :ok
  end  

  def create
  	@slide = Slide.new(slide_params)   
         
    if @slide.save
      render json: @slide, status: :created
    else
      render json: { errors: @slide.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @slide.nil?
      render json: { errors: 'Update Success' }, status: :update
    elsif !@slide.update(slide_params)
      render json: { errors: @slide.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
  	@slide = Slide.find(params[:id])   
    @slide.destroy   
    render json: { errors: 'Delete Success' }, status: :destroy
  end

  private   
    def slide_params   
    	params.permit(:photo,:heading,:content,:button_text,:button_url)   
  	end  
end
