module Dashboard
	class CategoriesController < ApplicationController
		def index
			@categories = Categori.all
		end

		def new
			@categori = Categori.new
		end

		def show
			@categori = Categori.find(params[:id])
		end

		def create
			@categori = Categori.new(categori_params)
			if @categori.save
					redirect_to dashboard_categories_path, notice: "Successfully uploaded."
			else
					render "new"
			end
		end

		def destroy
			@categori = Categori.find(params[:id])
			@categori.destroy
			redirect_to dashboard_categories_path, notice:  "Successfully deleted."
		end

		private

		def categori_params
			params.permit(:cat_name, :cat_banner, :meta_title, :meta_keyword, :meta_description)
		end
	end
end
