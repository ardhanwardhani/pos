class InstocksController < ApplicationController
	def index
		@incomes = IncomeStock.all
	end

	def show
	end

	def new
		@income = IncomeStock.new
	end

	def create
		@income = IncomeStock.new(resource_params)
		@income.fill_authable(current_user)
		if @income.save
			redirect_to instocks_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def resource_params
		params.require(:income_stock).permit(:id, :id_income_stock, :outlet_id, :date, :note)
	end
end