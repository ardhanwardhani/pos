class Employee < ApplicationRecord
	has_many :permits
	has_many :permits, :as => :permitable
	has_many :outlets, :through => :permit
	has_one :user_staff
	has_many :transactions

	def cek_pin(employee, pin)
		employee.pin = pin
	end
end
