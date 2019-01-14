class InstocksController < ApplicationController
	def index
		@incomes = IncomeStock.where(user_id: current_user.id)
	end

	def show
		@instock = IncomeStock.find(params[:id])
		@income_items = IncomeItem.where(income_stock_id: @instock.id)
	end

	def new
		@income = IncomeStock.new
	end

	def create
		@income = IncomeStock.new(resource_params)
		@last = IncomeStock.last
		@income.fill_authable(current_user)
		@income.fill_id_income_stock(@last)
		if @income.save
			flash[:success] = "Income Stock successfully created. Add item product for current income stock."
			redirect_to new_instock_initem_path(@income)
		else
			render 'new'
		end
	end

	private

	def resource_params
		params.require(:income_stock).permit(:id, :id_income_stock, :outlet_id, :date, :note)
	end
end