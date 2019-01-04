class PurchaseOrderItem < ApplicationRecord
	belongs_to :itemable, :polymorphic => true
	belongs_to :purchase_order
end
