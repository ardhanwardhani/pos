class StaffsController < ApplicationController
	def outlet
		@outlets = Outlet.where(user_id: current_user.id)
	end
end