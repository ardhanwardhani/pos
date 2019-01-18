class SuppliersController < ApplicationController
	def index
		@suppliers = Supplier.where(user_id: current_user)
	end

	def show
		@supplier = Supplier.find(params[:id])
	end

	def new
		@supplier = Supplier.new
	end

	def create
		@supplier = Supplier.new(resource_params)
		@supplieruser = current_user
		if @supplier.save
			flash[:success] = "Supplier successfully created"
			redirect_to suppliers_path
		else
			render 'new'
		end
	end

	def edit
		@supplier = Supplier.find(params[:id])
	end

	def update
		@supplier = Supplier.find(params[:id])
		if @supplier.update(resource_params)
			flash[:success] = "Supplier has been changed"
			redirect_to suppliers_path
		else
			render 'new'
		end
	end

	def destroy
		@supplier = Supplier.find(params[:id])
		if @supplier.destroy
			flash[:info] = "Supplier has been deleted"
			redirect_to suppliers_path
		end
	end

	private

	def resource_params
		params.require(:supplier).permit(:id, :name, :telephone, :email, :address)
	end
end