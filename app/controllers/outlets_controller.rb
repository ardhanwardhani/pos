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
			flash[:success] = "Outlet baru telah dibuat!"
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
			flash[:success] = "Outlet telah diubah!"
			redirect_to outlets_path
		else
			render 'new'
		end
	end

	def destroy
		@outlet = Outlet.find(params[:id])
		if @outlet.delete
			flash[:info] = "Outlet telah dihapus!"
			redirect_to outlets_path
		end
	end

	private

	def resource_params
		params.require(:outlet).permit(:id, :name, :address, :city, :telephone)
	end
end