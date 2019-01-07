class BussinessesController < ApplicationController
	def edit
		@bussiness = Bussiness.find(current_user.id)
		@user = current_user
	end

	def update
		@bussiness = Bussiness.find(current_user.id)
		if @bussiness.update(resource_params)
			redirect_to accounts_path
		else
			render 'edit'
		end
	end

	private

	def resource_params
		params.require(:bussiness).permit(:id, :name, :email, :province, :city, :telephone)
	end
end