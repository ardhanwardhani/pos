class Employee < ApplicationRecord
	#has_many :permit_employee, foreign_key: "employee_id", class_name: "Permit"
	has_many :permits, :as => :permitable
	has_many :outlets, :through => :permit
	has_one :user_staff
	has_many :transactions
  has_many :transactions, :as => :operatorable

  accepts_nested_attributes_for :permits

	def cek_pin?(employee, pin)
		employee.pin == pin
	end

	#after_create :permit

  private

  def permit
    permit = Permit.create(employee_id: self.id)
  end
end
