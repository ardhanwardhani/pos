class AccountsController < ApplicationController
	def index
		@bussiness = Bussiness.find_by(user_id: current_user.id)
	end
end