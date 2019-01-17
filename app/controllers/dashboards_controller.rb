class DashboardsController < ApplicationController
	def index
		@outlet = Outlet.where(user_id: current_user.id).count
		@transaction = Transaction.where(user_id: current_user.id).count
	end
end