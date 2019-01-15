class AccountsController < ApplicationController
	def index
		@bussiness = Bussiness.find_by(user_id: current_user.id)
	end

	def pin
	end

	def cek_pin
	end
end