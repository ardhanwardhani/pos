class Outlet < ApplicationRecord
	has_many :permits
	has_many :employees, :through => :permits
	has_many :transactions
	has_many :income_stocks
	has_many :outcome_stocks
	has_many :purchase_orders
	#has_many :user_staffs, :through => :permits PERMITABLE

	belongs_to :user
end
