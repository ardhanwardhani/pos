class Permit < ApplicationRecord
	belongs_to :outlet
	#belongs_to :employee, :optional => true
	belongs_to :permitable, :polymorphic => true
end
