class Outlet < ApplicationRecord
	has_many :permits
	has_many :income_stocks
	has_many :outcome_stocks
	has_many :purchase_orders
	has_many :employees, :through => :permit

	belongs_to :user

	def fill_user_id(current_user)
		self.user_id = current_user.id
	end
end
