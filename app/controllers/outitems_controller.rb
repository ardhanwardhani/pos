class OutitemsController < ApplicationController
	def new
		@outitem = OutcomeItem.new
		@outstock = OutcomeStock.find(params[:outstock_id])
		@outcome_items = OutcomeItem.where(outcome_stock_id: (params[:outstock_id]))
		@products = Product.where(user_id: current_user)
		@varians = Varian.where(user_id: current_user)
	end

	def create
		@outitem = OutcomeItem.new(resource_params)
		@outstock = OutcomeStock.find(params[:outstock_id])
		@outitem.outcome_stock = @outstock
		if @outitem.save
			redirect_to new_outstock_outitem_path(@outstock)
		else
			puts @outitem.errors.full_messages
		end
	end

	def destroy
		@outitem = OutcomeItem.find(params[:id])
		@outstock = OutcomeStock.find(params[:outstock_id])
		if @outitem.destroy
			redirect_to new_outstock_outitem_path(@outstock)
		end
	end

	private

	def resource_params
		params.require(:outcome_item).permit(:id, :outcome_stock_id, :itemable_type, :itemable_id, :amount)
	end
end