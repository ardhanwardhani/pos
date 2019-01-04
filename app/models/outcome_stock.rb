class OutcomeStock < ApplicationRecord
	has_many :outcome_items

	belongs_to :outlet
end
