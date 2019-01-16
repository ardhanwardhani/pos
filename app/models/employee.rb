class Employee < ApplicationRecord
	has_many :permits
	has_many :permits, :as => :permitable
	has_many :outlets, :through => :permit
	has_one :user_staff
	has_many :transactions

	def cek_pin(employee, pin)
		employee.pin = pin
	end

	def fill_user_id(current_user)
		self.user_id = current_user.id
	end

	#after_create :permit

  private

  def permit
    permit = Permit.create(employee_id: self.id)
  end
end
