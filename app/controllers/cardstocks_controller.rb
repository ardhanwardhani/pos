class CardstocksController < ApplicationController
	def index
		@products = Product.where(user_id: current_user.id)
		@varians = Varian.where(user_id: current_user.id)
		@income_stocks = IncomeStock.where(user_id: current_user.id)
		@outcome_stocks = OutcomeStock.where(user_id: current_user.id)
	end
end