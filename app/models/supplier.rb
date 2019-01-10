class Supplier < ApplicationRecord
	has_many :purchase_orders

	belongs_to :user

	def fill_user_id(current_user)
		self.user_id = current_user.id
	end
end
