class VariansController < ApplicationController
	def index
		@product = Product.find(params[:product_id])
		@varians = Varian.where("user_id = ? AND product_id = ?", current_user, @product)
	end

	def show
		@product = Product.find(params[:product_id])
		@varian = Varian.find(params[:id])
	end

	def edit
		@product = Product.find(params[:product_id])
		@varian = Varian.find(params[:id])
	end

	def update
		@varian = Varian.find(params[:id])
		if @varian.update(resource_params)
			redirect_to 
		else
		end
	end

	def onsale
		@product = Product.find(params[:product_id])
		@varian = Varian.find(params[:id])
		@varian.sale
		if @varian.save
			flash[:success] = "The varian has been entered into the sales list"
			redirect_to product_varian_path(@product, @varian)
		end
	end

	def notsold
		@product = Product.find(params[:product_id])
		@varian = Varian.find(params[:id])
		@varian.not_sale
		if @varian.save
			flash[:info] = "The varian has been removed from the sales list"
			redirect_to product_varian_path(@product, @varian)
		end
	end

	private

	def resource_params
		params.require(:varian).permit(:id, :product_id, :name, :price, :product_number, :barcode, :type_unit, :status, :description, :category_id, :user_id)
	end
end