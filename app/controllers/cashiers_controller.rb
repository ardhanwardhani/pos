class CashiersController < ApplicationController
	layout false
	
	def initializer
	end

	def index
	end

	def outlet
		@user = User.find(params[:user_id])
		@outlets = Outlet.where(user_id: @user.id)
	end
end