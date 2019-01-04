class Employee < ApplicationRecord
	has_many :permits
	has_one :user_staffs
	has_many :transactions
	has_many :outlets, :through => :permit
end
