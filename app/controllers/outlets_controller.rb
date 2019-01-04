class OutletsController < ApplicationController

	def index
		@outlets = Outlet.all
	end

	def show
		@outlet = Outlet.find(params[:id])
	end

	def new
		@outlet = Outlet.new
	end

	def create
		@outlet = Outlet.new(resource_params)
		@outlet.fill_user_id(current_user)
		if @outlet.save
			redirect_to outlets_path
		else
			render 'new'
		end
	end

	def edit
		@outlet = Outlet.find(params[:id])
	end

	def update
		@outlet = Outlet.find(params[:id])
		if @outlet.update(resource_params)
			redirect_to outlets_path
		else
			render 'new'
		end
	end

	def destroy
		@outlet = Outlet.find(params[:id])
		if @outlet.delete
			redirect_to outlets_path
		end
	end

	private

	def resource_params
		params.require(:outlet).permit(:id, :name, :address, :city, :telephone)
	end
end