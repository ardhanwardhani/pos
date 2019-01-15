class Transaction < ApplicationRecord
	has_many :transaction_items
	has_one :payment

	belongs_to :member, :optional => true
end
