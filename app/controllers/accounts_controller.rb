class AccountsController < ApplicationController
	def index
		@bussiness = Bussiness.where(user_id: current_user).first
	end

	def pin
	end

	def cek_pin
	end
end