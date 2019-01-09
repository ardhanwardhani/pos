class PurchaseOrder < ApplicationRecord
	has_many :purchase_order_items

	belongs_to :outlet
	belongs_to :supplier
	belongs_to :authable, :polymorphic => true
end
