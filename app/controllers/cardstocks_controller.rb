class CardstocksController < ApplicationController
	def index
		@products = Product.where(user_id: current_user)
		@varians = Varian.where(user_id: current_user)
		@income_stocks = IncomeStock.where(user_id: current_user)
		@outcome_stocks = OutcomeStock.where(user_id: current_user)
	end
end