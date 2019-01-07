class Member < ApplicationRecord
	has_many :transactions

	belongs_to :user

	def fill_user_id(current_user)
		self.user_id = current_user.id
	end
end