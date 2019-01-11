class IncomeStock < ApplicationRecord
	has_many :income_items
	#accepts_nested_attributes_for :income_items, allow_destroy: true

	belongs_to :outlet
	belongs_to :authable, :polymorphic => true

	def fill_authable(current_user)
		self.authable_type = current_user.class.name
		self.authable_id = current_user.id
		self.user_id = current_user.id
	end

	def fill_id_income_stock(last)
    if last.nil?
      self.id_income_stock = "IS-1"
    else
      kode = last.id_income_stock[3..5]
      kode = kode.to_i + 1
      self.id_income_stock = "IS-" + kode.to_s
    end
  end
end
