class IncomeStock < ApplicationRecord
	has_many :income_items

	belongs_to :outlet
end
