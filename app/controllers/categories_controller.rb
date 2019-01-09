class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(resource_params)
		@category.fill_user_id(current_user)
		if @category.save
			redirect_to categories_path
		else
			render 'new'
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(resource_params)
			redirect_to categories_path
		else
			render 'new'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		if @category.destroy
			redirect_to categories_path
		end
	end

	private

	def resource_params
		params.require(:category).permit(:id, :name)
	end

end