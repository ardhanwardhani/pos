class OutcomeItem < ApplicationRecord
	belongs_to :itemable, :polymorphic => true
	belongs_to :outcome_stock
end
