class TransactionItem < ApplicationRecord
	belongs_to :itemable, :polymorphic => true
	belongs_to :trans_data, class_name: 'Transaction', foreign_key: :transaction_id

	def update_total(trans_item, transaction)
		
	end
end
