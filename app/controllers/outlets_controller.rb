class OutletsController < ApplicationController

	def index
		@outlets = Outlet.where(user_id: current_user)
	end

	def show
		@outlet = Outlet.find(params[:id])
	end

	def new
		@outlet = Outlet.new
	end

	def create
		@outlet = Outlet.new(resource_params)
		@outlet.user = current_user
		if @outlet.save
			flash[:success] = "New outlet successfully created"
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
			flash[:success] = "Outlet has been changed"
			redirect_to outlets_path
		else
			render 'new'
		end
	end

	def destroy
		@outlet = Outlet.find(params[:id])
		if @outlet.delete
			flash[:info] = "Outlet has been deleted"
			redirect_to outlets_path
		end
	end

	private

	def resource_params
		params.require(:outlet).permit(:id, :name, :address, :city, :telephone)
	end
end