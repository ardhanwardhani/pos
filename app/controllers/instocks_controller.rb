class InstocksController < ApplicationController
	def index
		@incomes = IncomeStock.where(user_id: current_user)
	end

	def show
		@instock = IncomeStock.find(params[:id])
		@income_items = IncomeItem.where(income_stock_id: @instock.id)
	end

	def new
		@income = IncomeStock.new
		@outlets = Outlet.where(user_id: current_user.id)
	end

	def create
		@income = current_user.income_stocks.build(resource_params)
		@last = IncomeStock.last
		@income.user_id = current_user
		@income.fill_income_stock(@last)
		if @income.save
			flash[:success] = "Income Stock successfully created. Add item product for current income stock."
			redirect_to new_instock_initem_path(@income)
		else
			puts @income.errors.full_messages
			render 'new'
		end
	end

	private

	def resource_params
		params.require(:income_stock).permit(:id, :id_income_stock, :outlet_id, :date, :note)
	end
end