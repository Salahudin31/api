class SocialsController < ApplicationController
	skip_before_action :verify_authenticity_token
  before_action :authorize__traveller_request, except: [:index, :show]
	
	def index
  	@socials = Social.all  
  	render json: @socials, status: :ok 
  end

  def new
  	@social = Social.new   
  end

  def show_image
  	@social = Social.find(params[:id])
  	send_data @social.image, :type => 'image/png',:disposition => 'inline'
  end

  def show
  	@social = Social.find(params[:id])
  	render json: @social, status: :ok
  end  

  def create
  	@social = Social.new(social_params)   
         
    if @social.save
      render json: @social, status: :created
    else
      render json: { errors: @social.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    @social = Social.find(params[:id])
    if @social.update_attributes(social_params)
      render json: { Message: 'Update Success', social: @social },
             status: :update
    else
      render json: { errors: @social.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_multiple
    
    params[:object].each do |url|
      @social = Social.where(:id => url[:id]).update(:url => url[:url])  
    end

  end

  def destroy
  	@social = Social.find(params[:id])   
    @social.destroy   
    render json: { errors: 'Delete Success' }, status: :destroy
  end

  private   
    def social_params   
    	params.permit(:name,:url,:icon)   
  	end  

end
