class OutstocksController < ApplicationController
	def index
		@outcomes = OutcomeStock.all
	end

	def show
		@outstock = OutcomeStock.find(params[:id])
		@outcome_items = OutcomeItem.where(outcome_stock_id: @outstock.id)
	end

	def new
		@outcome = OutcomeStock.new
	end

	def create
		@outcome = current_user.outcome_stocks.build(resource_params)
		@outcome.user = current_user
		@last = OutcomeStock.last
		@outcome.fill_outcome_stock(@last)
		if @outcome.save
			flash[:success] = "Outcome Stock successfully created"
			redirect_to  new_outstock_outitem_path(@outcome)
		else
			render 'new'
		end
	end

	private

	def resource_params
		params.require(:outcome_stock).permit(:id, :id_income_stock, :outlet_id, :date, :note)
	end
end