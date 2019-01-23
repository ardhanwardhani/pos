module Api::V1
	class ProductsController < BaseApiController

		before_action :set_product, only: [:show, :update, :destroy]

		def index
			@products = current_user.products
			render json: @products, each_serializer: ProductSerializer, status: 200
		end

		def show
			@varians = Varian.where(product_id: @product)

			render json: {:product => @product, :varians => @varians}, each_serializer: ProductSerializer, status: 200
		end

		def create
			@product = Product.new(product_params)
			@product.user_id = current_user.id
			if @product.save
				render json: @product, status: :created, location: api_v1_products_path(@product)
			else
				render json: @product.errors, status: :unprocessable_entity
			end
		end

		def update
			if @product.update(product_params)
				render json: @product
			else
				render json: @product.errors, status: :unprocessable_entity
			end
		end

		def destroy
			@product.destroy
		end

		private

		def set_product
			@product = Product.find(params[:id])
		end

		def product_params
			params.require(:product).permit(:name, :price, :product_number, :barcode, :type_unit, :description, :tax, :type, :category_id, :user_id, :group_varians, :image)
		end
	end
end