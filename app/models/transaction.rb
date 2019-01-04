class Transaction < ApplicationRecord
	has_many :transaction_items
	has_one :payment
end
