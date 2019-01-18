class DashboardsController < ApplicationController
	def index
		@outlet = Outlet.where(user_id: current_user).count
		@transaction = Transaction.where(user_id: current_user).count
	end
end