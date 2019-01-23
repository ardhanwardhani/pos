module Api
	class BaseApiController < ApplicationController
		attr_reader :user
		before_action :cek_access_token
		include ActionController::Serialization
		# include ApiAuthentication
		skip_before_action :authenticate_user!
		skip_before_action :verify_authenticity_token
		respond_to :json

		# def set_user
		# 	@user = User.find(params[:id])
		# end

		def current_user
			@user = User.where(access_token: params[:access_token]).first
		end

		def cek_access_token
			if current_user.present?
				if current_user.access_token_created_at <= 1.day.ago
					render json: {message: "Access Token Expired"}, status: 401
				end
			else
				render json: {message: "Unauthorized"}, status: 401
			end
		end
	end
end