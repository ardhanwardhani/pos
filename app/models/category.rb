class Category < ApplicationRecord
	has_many :products
	has_many :varians


	def fill_user_id(current_user)
		self.user_id = current_user.id
	end
end
