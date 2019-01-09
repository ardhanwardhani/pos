class OutstocksController < ApplicationController
	def index
		@outcomes = OutcomeStock.all
	end

	def show
	end

	def new
		@outcome = OutcomeStock.new
	end

	def create
		@outcome = IncomeStock.new(resource_params)
		@outcome.fill_authable(current_user)
		if @income.save
			redirect_to outstocks_path
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
		params.require(:outcome_stock).permit(:id, :id_income_stock, :outlet_id, :date, :note)
	end
end