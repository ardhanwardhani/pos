class TransactionItem < ApplicationRecord
	belongs_to :itemable, :polymorphic => true
	belongs_to :transaction
end
