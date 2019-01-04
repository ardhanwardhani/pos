class Permit < ApplicationRecord
	belongs_to :outlet
	belongs_to :employee
end
