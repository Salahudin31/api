class Api::LuarNegerisController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authorize_request
	
	def index
  	@luar_negeris = LuarNegeri.all  
  	render json: @luar_negeris, status: :ok 
  end

  def new
  	@luar_negeri = LuarNegeri.new   
  end

  def show_image
  	@luar_negeri = LuarNegeri.find(params[:id])
  	send_data @luar_negeri.image, :type => 'image/png',:disposition => 'inline'
  end

  def show
  	@luar_negeri = LuarNegeri.find(params[:id])
  	render json: @luar_negeri, status: :ok
  end  

  def create
  	@luar_negeri = LuarNegeri.new(luar_negeri_params)   
         
    if @luar_negeri.save
      render json: @luar_negeri, status: :created
    else
      render json: { errors: @luar_negeri.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @luar_negeri.nil?
      render json: { errors: 'Update Success' }, status: :update
    elsif !@luar_negeri.update(luar_negeri_params)
      render json: { errors: @luar_negeri.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
  	@luar_negeri = LuarNegeri.find(params[:id])   
    @luar_negeri.destroy   
    render json: { errors: 'Delete Success' }, status: :destroy
  end

  private   
    def luar_negeri_params   
    	params.permit(:name,:photo,:banner_photo,:description,:short_description,:meta_title,:meta_keyword,:meta_description)   
  	end  
end
