class Api::FaqsController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authorize_request
	
	def index
  	@faqs = Faq.all  
  	render json: @faqs, status: :ok 
  end

  def new
  	@faq = Faq.new   
  end

  def show_image
  	@faq = Faq.find(params[:id])
  	send_data @faq.image, :type => 'image/png',:disposition => 'inline'
  end

  def show
  	@faq = Faq.find(params[:id])
  	render json: @faq, status: :ok
  end  

  def create
  	@faq = Faq.new(faq_params)   
         
    if @faq.save
      render json: @faq, status: :created
    else
      render json: { errors: @faq.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @faq.nil?
      render json: { errors: 'Update Success' }, status: :update
    elsif !@faq.update(faq_params)
      render json: { errors: @faq.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
  	@faq = Faq.find(params[:id])   
    @faq.destroy   
    render json: { errors: 'Delete Success' }, status: :destroy
  end

  private   
    def faq_params   
    	params.permit(:title,:content)   
  	end  

end
