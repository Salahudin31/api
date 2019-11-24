class Api::CatatanPerjalanansController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authorize_request
	
	def index
  	@catatan_perjalanans = CatatanPerjalanan.all  
  	render json: @catatan_perjalanans, status: :ok 
  end

  def new
  	@catatan_perjalanan = CatatanPerjalanan.new   
  end

  def show_image
  	@catatan_perjalanan = CatatanPerjalanan.find(params[:id])
  	send_data @catatan_perjalanan.image, :type => 'image/png',:disposition => 'inline'
  end

  def show
  	@catatan_perjalanan = CatatanPerjalanan.find(params[:id])
  	render json: @catatan_perjalanan, status: :ok
  end  

  def create
  	@catatan_perjalanan = CatatanPerjalanan.new(catatan_perjalanan_params)   
         
    if @catatan_perjalanan.save
      render json: @catatan_perjalanan, status: :created
    else
      render json: { errors: @catatan_perjalanan.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @catatan_perjalanan.nil?
      render json: { errors: 'Update Success' }, status: :update
    elsif !@catatan_perjalanan.update(catatan_perjalanan_params)
      render json: { errors: @catatan_perjalanan.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
  	@catatan_perjalanan = CatatanPerjalanan.find(params[:id])   
    @catatan_perjalanan.destroy   
    render json: { errors: 'Delete Success' }, status: :destroy
  end

  private   
    def catatan_perjalanan_params   
    	params.permit(:name,:description,:photo,:banner_photo,:meta_title,:meta_keyword,:meta_description)   
  	end  
end
