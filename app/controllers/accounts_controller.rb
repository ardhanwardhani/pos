class AccountsController < ApplicationController
	def index
		@user = current_user
		@bussiness = Bussiness.find_by(user_id: current_user.id)
	end
end