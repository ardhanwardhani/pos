module ApplicationHelper

	def trasaction_operator_link(outlet, operator, transaction)
		if operator.class.name == "User"
			return admin_transaction_item_path(outlet, operator, transaction)
		elsif operator.class.name == "Employee"
			return transaction_item_path(outlet, operator, transaction)
		end
	end
end
