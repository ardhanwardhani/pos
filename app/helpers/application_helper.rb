module ApplicationHelper

	def get_operator_type(operator)
		if operator.class.name == "User"
			return "superadmin"
		elsif operator.class.name == "Employee"
			return "cashier"
		end
	end
end
