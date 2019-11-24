class Api::SettingsController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authorize_request
	
	def index
  	@settings = Setting.all  
  	render json: @settings, status: :ok 
  end

  def new
  	@setting = Setting.new   
  end

  def show_image
  	@setting = Setting.find(params[:id])
  	send_data @setting.image, :type => 'image/png',:disposition => 'inline'
  end

  def show
  	@setting = Setting.find(params[:id])
  	render json: @setting, status: :ok
  end  

  def create
  	@setting = Setting.new(setting_params)   
         
    if @setting.save
      render json: @setting, status: :created
    else
      render json: { errors: @setting.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    @setting = Setting.find(params[:id])
    if @setting.update_attributes(setting_params)
      render json: { Message: 'Update Success', page: @setting },
             status: :update
    else
      render json: { errors: @setting.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_logo
    @setting = Setting.find(params[:id])
    if @setting.update(logo_params)
      render json: { Message: 'Update Success', page: @setting },
             status: :update
    else
      render json: { errors: @setting.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_favicon
    @setting = Setting.find(params[:id])
    if @setting.update_attributes(favicon_params)
      render json: { Message: 'Update Success', page: @setting },
             status: :update
    else
      render json: { errors: @setting.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_generalContent
    @setting = Setting.find(params[:id])
    if @setting.update_attributes(generalContent_params)
      render json: { Message: 'Update Success', page: @setting },
             status: :update
    else
      render json: { errors: @setting.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_email
    @setting = Setting.find(params[:id])
    if @setting.update_attributes(email_params)
      render json: { Message: 'Update Success', page: @setting },
             status: :update
    else
      render json: { errors: @setting.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_articleWisata
    @setting = Setting.find(params[:id])
    if @setting.update_attributes(articleWisata_params)
      render json: { Message: 'Update Success', page: @setting },
             status: :update
    else
      render json: { errors: @setting.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_homePage
    @setting = Setting.find(params[:id])
    if @setting.update_attributes(homePage_params)
      render json: { Message: 'Update Success', page: @setting },
             status: :update
    else
      render json: { errors: @setting.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_banner
    @setting = Setting.find(params[:id])
    if @setting.update_attributes(banner_params)
      render json: { Message: 'Update Success', page: @setting },
             status: :update
    else
      render json: { errors: @setting.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_payment
    @setting = Setting.find(params[:id])
    if @setting.update_attributes(payment_params)
      render json: { Message: 'Update Success', page: @setting },
             status: :update
    else
      render json: { errors: @setting.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
  	@setting = Setting.find(params[:id])   
    @setting.destroy   
    render json: { errors: 'Delete Success' }, status: :destroy
  end

  private   
    def setting_params   
    	params.permit(
        :logo,
        :favicon,
        :footer_copyright,:footer_address,:footer_email,:footer_phone,:header_email,:header_phone,
        :send_email_from,:send_email_to,
        :total_populer,:total_footer_tujuan_wisata,:total_sidebar_tujuan_wisata,:total_sidebar_article_populer,
        :total_sidebar_article_terbaru,
        :home_title_service,:home_subtitle_service,:home_status_service,:activity_title_service,
        :activity_subtitle_service,:activity_status_service,:catatan_title_service,:catatan_subtitle_service,
        :catatan_status_service,:destination_title_service,:destination_subtitle_service,:destination_status_service,
        :dalam_negeri_title_service,:dalam_negeri_subtitle_service,:dalam_negeri_status_service,:luar_negeri_title_service,
        :luar_negeri_subtitle_service,:luar_negeri_status_service,:news_letter_title_service,:news_letter_subtitle_service,
        :news_letter_status_service,
        :banner_activity,:banner_destination,:banner_catatan,:banner_contact,:banner_about,:photo_about,:banner_faq,
        :banner_team,:banner_payment,:banner_payment_success,:banner_payment_pending,:banner_login,:banner_register,
        :banner_forget_password,:banner_reset_password,:banner_reset_password_success,:banner_verify_register,
        :paypal_email
      )   
  	end  

    def logo_params
      params.permit(:logo)
    end

    def favicon_params
      params.permit(:favicon)
    end

    def generalContent_params
      params.permit(:footer_copyright,:footer_address,:footer_email,:footer_phone,:header_email,:header_phone)
    end

    def email_params
      params.permit(:send_email_from,:send_email_to)
    end

    def articleWisata_params
      params.permit(
      		:total_populer,:total_footer_tujuan_wisata,:total_sidebar_tujuan_wisata,:total_sidebar_article_populer,
        	:total_sidebar_article_terbaru
      	)
    end

    def homePage_params
      params.permit(
      		:home_title_service,:home_subtitle_service,:home_status_service,:activity_title_service,
	        :activity_subtitle_service,:activity_status_service,:catatan_title_service,:catatan_subtitle_service,
	        :catatan_status_service,:destination_title_service,:destination_subtitle_service,:destination_status_service,
	        :dalam_negeri_title_service,:dalam_negeri_subtitle_service,:dalam_negeri_status_service,:luar_negeri_title_service,
	        :luar_negeri_subtitle_service,:luar_negeri_status_service,:news_letter_title_service,:news_letter_subtitle_service,
	        :news_letter_status_service
      	)
    end

    def banner_params
      params.permit(
      		:banner_activity,:banner_destination,:banner_catatan,:banner_contact,:banner_about,:photo_about,:banner_faq,
	        :banner_team,:banner_payment,:banner_payment_success,:banner_payment_pending,:banner_login,:banner_register,
	        :banner_forget_password,:banner_reset_password,:banner_reset_password_success,:banner_verify_register
      	)
    end

    def payment_params
      params.permit(:paypal_email)
    end

end
