class Varian < ApplicationRecord
	include AASM
	has_many :income_items, :as => :itemable
	has_many :outcome_items, :as => :itemable
	has_many :purchase_order_items, :as => :itemable
	has_many :transaction_items, :as => :itemable

	belongs_to :product
	belongs_to :user
	belongs_to :category, :optional => true

	aasm :column => 'status' do
		state :on_sale, :initial => true
		state :not_sold

		event :sale do
			transitions :from => :not_sold, :to => :on_sale
		end

		event :not_sale do
			transitions :from => :on_sale, :to => :not_sold
		end
	end
end
