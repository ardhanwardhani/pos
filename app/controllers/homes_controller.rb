class HomesController < ApplicationController
	def index
		@outlet = Outlet.all
	end
end