class Api::PagesController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authorize_request
	
	def index
  	@pages = Page.all  
  	render json: @pages, status: :ok 
  end

  def new
  	@page = Page.new   
  end

  def show_image
  	@page = Page.find(params[:id])
  	send_data @page.image, :type => 'image/png',:disposition => 'inline'
  end

  def show
  	@page = Page.find(params[:id])
  	render json: @page, status: :ok
  end  

  def create
  	@page = Page.new(page_params)   
         
    if @page.save
      render json: @page, status: :created
    else
      render json: { errors: @page.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      render json: { Message: 'Update Success', page: @page },
             status: :update
    else
      render json: { errors: @page.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_home
    @page = Page.find(params[:id])
    if @page.update(pageHome_params)
      render json: { Message: 'Update Success', page: @page },
             status: :update
    else
      render json: { errors: @page.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_about
    @page = Page.find(params[:id])
    if @page.update_attributes(pageAbout_params)
      render json: { Message: 'Update Success', page: @page },
             status: :update
    else
      render json: { errors: @page.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_faq
    @page = Page.find(params[:id])
    if @page.update_attributes(pageFaq_params)
      render json: { Message: 'Update Success', page: @page },
             status: :update
    else
      render json: { errors: @page.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_activity
    @page = Page.find(params[:id])
    if @page.update_attributes(pageActivity_params)
      render json: { Message: 'Update Success', page: @page },
             status: :update
    else
      render json: { errors: @page.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_contact
    @page = Page.find(params[:id])
    if @page.update_attributes(pageContact_params)
      render json: { Message: 'Update Success', page: @page },
             status: :update
    else
      render json: { errors: @page.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_search
    @page = Page.find(params[:id])
    if @page.update_attributes(pageSearch_params)
      render json: { Message: 'Update Success', page: @page },
             status: :update
    else
      render json: { errors: @page.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_terms
    @page = Page.find(params[:id])
    if @page.update_attributes(pageTerms_params)
      render json: { Message: 'Update Success', page: @page },
             status: :update
    else
      render json: { errors: @page.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_privacy
    @page = Page.find(params[:id])
    if @page.update_attributes(pagePrivacy_params)
      render json: { Message: 'Update Success', page: @page },
             status: :update
    else
      render json: { errors: @page.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_team
    @page = Page.find(params[:id])
    if @page.update_attributes(pageTeam_params)
      render json: { Message: 'Update Success', page: @page },
             status: :update
    else
      render json: { errors: @page.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
  	@page = Page.find(params[:id])   
    @page.destroy   
    render json: { errors: 'Delete Success' }, status: :destroy
  end

  private   
    def page_params   
    	params.permit(
        :mt_home, :mk_home, :md_home,
        :about_heading, :about_content, :mt_about, :mk_about, :md_about,
        :faq_heading, :faq_content, :mt_faq, :mk_faq, :md_faq,
        :activity_heading, :activity_content, :mt_activity, :mk_activity, :md_activity,
        :contact_heading, :contact_address, :contact_email, :contact_phone, :contact_map, :mt_contact, :mk_contact, :md_contact,
        :search_heading, :mt_search, :mk_search, :md_search,
        :term_heading, :term_content, :mt_term, :mk_term, :md_term,
        :privacy_heading, :privacy_content, :mt_privacy, :mk_privacy, :md_privacy,
        :team_heading, :team_content, :mt_team, :mk_team, :md_team
      )   
  	end  

    def pageHome_params
      params.permit(:mt_home, :mk_home, :md_home)
    end

    def pageAbout_params
      params.permit(:about_heading, :about_content, :mt_about, :mk_about, :md_about)
    end

    def pageFaq_params
      params.permit(:faq_heading, :faq_content, :mt_faq, :mk_faq, :md_faq)
    end

    def pageActivity_params
      params.permit(:activity_heading, :activity_content, :mt_activity, :mk_activity, :md_activity)
    end

    def pageContact_params
      params.permit(:contact_heading, :contact_address, :contact_email, :contact_phone, :contact_map, :mt_contact, :mk_contact, :md_contact)
    end

    def pageSearch_params
      params.permit(:search_heading, :mt_search, :mk_search, :md_search)
    end

    def pageTerms_params
      params.permit(:term_heading, :term_content, :mt_term, :mk_term, :md_term)
    end

    def pagePrivacy_params
      params.permit(:privacy_heading, :privacy_content, :mt_privacy, :mk_privacy, :md_privacy)
    end

    def pageTeam_params
      params.permit(:team_heading, :team_content, :mt_team, :mk_team, :md_team)
    end

end
