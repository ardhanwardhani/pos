class Varian < ApplicationRecord
	has_many :income_items, :as => :itemable
	has_many :outcome_items, :as => :itemable
	has_many :purchase_order_items, :as => :itemable
	has_many :transaction_items, :as => :itemable

	belongs_to :product
	belongs_to :user
end
