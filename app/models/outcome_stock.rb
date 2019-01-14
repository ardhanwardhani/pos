class OutcomeStock < ApplicationRecord
	has_many :outcome_items

	belongs_to :outlet
	belongs_to :authable, :polymorphic => true

	def fill_authable(current_user)
		self.authable_type = current_user.class.name
		self.authable_id = current_user.id
		self.user_id = current_user.id
	end
	
	def fill_id_outcome_stock(last)
    if last.nil?
      self.id_outcome_stock = "OS-1"
    else
      kode = last.id_outcome_stock[3..5]
      kode = kode.to_i + 1
      self.id_outcome_stock = "OS-" + kode.to_s
    end
  end
end
