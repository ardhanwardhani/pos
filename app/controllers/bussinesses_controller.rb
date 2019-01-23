class BussinessesController < ApplicationController
	before_action :set_data, only: [:edit, :update]
	def edit
	end

	def update
		if @bussiness.update(resource_params)
			flash[:success] = "Your bussiness information has change"
			redirect_to accounts_path
		else
			render 'edit'
		end
	end

	private

	def set_data
		@bussiness = Bussiness.find(current_user)
	end

	def resource_params
		params.require(:bussiness).permit(:id, :name, :email, :province, :city, :telephone)
	end
end