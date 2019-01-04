class PurchaseOrder < ApplicationRecord
	has_many :purchase_order_items

	belongs_to :outlet
	belongs_to :supplier
end
