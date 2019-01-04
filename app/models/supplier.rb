class Supplier < ApplicationRecord
	has_many :purchase_orders

	belongs_to :user
end
