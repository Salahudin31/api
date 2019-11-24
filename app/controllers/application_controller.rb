class ApplicationController < ActionController::Base
	attr_reader :current_user

  	def not_found
		render json: { error: 'not_found' }
	end

	def authorize_request
		header = request.headers['Authorization']
		header = header.split(' ').last if header
		begin
		  @decoded = JsonWebToken.decode(header)
		  @current_user = User.find(@decoded[:user_id])
		rescue ActiveRecord::RecordNotFound
		  render json: { error: 'unauthorized' }, status: :unauthorized
		rescue JWT::DecodeError
		  render json: { error: 'unauthorized' }, status: :unauthorized
		end
  	end

  	def authorize__traveller_request
  		header = request.headers['Authorization']
		header = header.split(' ').last if header
		begin
		  @decoded = JsonWebToken.decode(header)
		  @current_user = Traveller.find(@decoded[:trav_user_id])
		rescue ActiveRecord::RecordNotFound
		  render json: { error: 'unauthorized' }, status: :unauthorized
		rescue JWT::DecodeError
		  render json: { error: 'unauthorized' }, status: :unauthorized
		end
  	end
end
