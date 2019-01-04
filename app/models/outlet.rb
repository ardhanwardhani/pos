class Outlet < ApplicationRecord
	has_many :permits
	has_many :income_stocks
	has_many :outcome_stocks
	has_many :purchase_orders

	belongs_to :user
end
