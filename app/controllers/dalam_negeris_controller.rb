class DalamNegerisController < ApplicationController
	skip_before_action :verify_authenticity_token
  before_action :authorize__traveller_request, except: [:index, :show]
	
	def index
  	@dalam_negeris = DalamNegeri.all  
  	render json: @dalam_negeris, status: :ok 
  end

  def new
  	@dalam_negeri = DalamNegeri.new   
  end

  def show_image
  	@dalam_negeri = DalamNegeri.find(params[:id])
  	send_data @dalam_negeri.image, :type => 'image/png',:disposition => 'inline'
  end

  def show
  	@dalam_negeri = DalamNegeri.find(params[:id])
  	render json: @dalam_negeri, status: :ok
  end  

  def create
  	@dalam_negeri = DalamNegeri.new(dalam_negeri_params)   
         
    if @dalam_negeri.save
      render json: @dalam_negeri, status: :created
    else
      render json: { errors: @dalam_negeri.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @dalam_negeri.nil?
      render json: { errors: 'Update Success' }, status: :update
    elsif !@dalam_negeri.update(dalam_negeri_params)
      render json: { errors: @dalam_negeri.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
  	@dalam_negeri = DalamNegeri.find(params[:id])   
    @dalam_negeri.destroy   
    render json: { errors: 'Delete Success' }, status: :destroy
  end

  private   
    def dalam_negeri_params   
    	params.permit(:name,:photo,:banner_photo,:description,:short_description,:meta_title,:meta_keyword,:meta_description)   
  	end  
end
