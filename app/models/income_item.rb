class IncomeItem < ApplicationRecord
	belongs_to :itemable, :polymorphic => true
	belongs_to :income_stock
end
