class OutletsController < ApplicationController
	before_action :set_data, only: [:show, :edit, :update, :destroy]

	def index
		@outlets = Outlet.where(user_id: current_user)
	end

	def show
		
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
		
	end

	def update
		if @outlet.update(resource_params)
			flash[:success] = "Outlet has been changed"
			redirect_to outlets_path
		else
			render 'new'
		end
	end

	def destroy
		if @outlet.delete
			flash[:info] = "Outlet has been deleted"
			redirect_to outlets_path
		end
	end

	private

	def set_data
		@outlet = Outlet.find(params[:id])
	end

	def resource_params
		params.require(:outlet).permit(:id, :name, :address, :city, :telephone)
	end
end