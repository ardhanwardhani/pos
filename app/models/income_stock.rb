class IncomeStock < ApplicationRecord
	has_many :income_items
	accepts_nested_attributes_for :income_items, allow_destroy: true

	belongs_to :outlet
	belongs_to :authable, :polymorphic => true

	def fill_authable(current_user)
		self.authable_type = current_user.class.name
		self.authable_id = current_user.id
	end
end
