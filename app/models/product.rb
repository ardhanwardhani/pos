class Product < ApplicationRecord
	has_many :varians
	has_many :income_items, :as => :itemable
	has_many :outcome_items, :as => :itemable
	has_many :purchase_order_items, :as => :itemable
	has_many :transaction_items, :as => :itemable
	has_one :image, :as => :imageable

	belongs_to :category
end
