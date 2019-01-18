class ProductsController < ApplicationController
	def index
		@products = Product.where(user_id: current_user)
		@products.each do |p|
			if p.group_varians.present?
				@minimum = p.varians.minimum("price")
				@maximum = p.varians.maximum("price")
			end
		end
	end

	def show
		@product = Product.find(params[:id])
		@varians = Varian.where(product_id: @product)
	end

	def new
		@product = Product.new
		@categories = Category.where(user_id: current_user)
	end

	def create
		@product = Product.new(resource_params)
		@product.group_varians = JSON.parse(params[:product][:group_varians])
		@product.user_id = current_user
		if @product.save
			if @product.group_varians.present?
				flash[:success] = "Product successfully created."
				flash[:warning] = " Manage your varian product data"
				redirect_to product_path(@product)
			else
				flash[:success] = "Product successfully created"
				redirect_to product_path(@product)
			end
		else
			render 'new'
		end
	end

	def edit
		@product = Product.find(params[:id])
		@categories = Category.where(user_id: current_user)
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

	def onsale
		@product = Product.find(params[:id])
		@product.sale
		if @product.save
			flash[:success] = "The product has been entered into the sales list"
			redirect_to product_path(@product)
		end
	end

	def notsold
		@product = Product.find(params[:id])
		@product.not_sale
		if @product.save
			flash[:info] = "The product has been removed from the sales list"
			redirect_to product_path(@product)
		end
	end

	private

	def resource_params
		params.require(:product).permit(:id, :name, :price, :product_number, :barcode, :type_unit, :status, :description, :category_id, :image)
	end
end