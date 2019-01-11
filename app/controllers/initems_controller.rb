class InitemsController < ApplicationController
	def new
		@initem = IncomeItem.new
		@instock = IncomeStock.find(params[:instock_id])
		@income_items = IncomeItem.where(income_stock_id: (params[:instock_id]))
		@products = Product.where(user_id: current_user.id)
		@varians = Varian.where(user_id: current_user.id)
	end

	def create
		@initem = IncomeItem.new(resource_params)
		@instock = IncomeStock.find(params[:instock_id])
		@initem.income_stock_id = @instock.id
		if @initem.save
			redirect_to new_instock_initem_path(@instock)
		else
			puts @initem.errors.full_messages
		end
	end

	def destroy
		@initem = IncomeItem.find(params[:id])
		@instock = IncomeStock.find(params[:instock_id])
		if @initem.destroy
			redirect_to new_instock_initem_path(@instock)
		end
	end

	private

	def resource_params
		params.require(:income_item).permit(:id, :income_stock_id, :itemable_type, :itemable_id, :amount, :unit_price, :total)
	end
end