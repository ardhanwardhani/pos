class Employee < ApplicationRecord
	has_many :permits
	has_one :user_staffs
	has_many :transactions
end
