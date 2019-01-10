class ProductsController < ApplicationController
	def index
		@products = Product.where(user_id: current_user.id)
	end

	def show
		@product = Product.find(params[:id])
		@varians = Varian.where(product_id: @product.id)
	end

	def new
		@product = Product.new
		@categories = Category.all
	end

	def create
		@product = Product.new(resource_params)
		@product.group_varians = JSON.parse(params[:product][:group_varians])
		@product.fill_user_id(current_user)

		if @product.save
			flash[:success] = "Product successfully created"
			redirect_to product_path(@product)
		else
			render 'new'
		end
	end

	def edit
		@product = Product.find(params[:id])
		@categories = Category.all
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(resource_params)
			flash[:success] = "Product has been changed"
			redirect_to products_path
		else
			render 'new'
		end
	end

	def destroy
		@product = Product.find(params[:id])
		if @product.destroy
			flash[:info] = "Product has been deleted"
			redirect_to products_path
		end
	end

	private

	def resource_params
		params.require(:product).permit(:id, :name, :price, :product_number, :barcode, :type_unit, :status, :description, :category_id)
	end
end