class TransactionItemsController < ApplicationController
	layout false
	before_action :get_operator

	def new
		@outlet = Outlet.find(params[:outlet_id])
		@transaction = Transaction.find(params[:transaction_id])
		@trans_items = TransactionItem.where(transaction_id: @transaction)
		total = 0
			@trans_items.each do |i|
			product = i.itemable
			total += i.amount_unit.to_i * product.price
			@transaction.update(total: total.to_s)
			end
		@transitem = TransactionItem.new
		@products = Product.where("user_id = ? AND status = ?", current_user, "on_sale")
		@varians = Varian.where("user_id = ? AND status = ?", current_user, "on_sale")
	end

	def create
		@outlet = Outlet.find(params[:outlet_id])
		@transaction = Transaction.find(params[:transaction_id])
		@trans_item = TransactionItem.where(transaction_id: @transaction)
		@transitem = TransactionItem.new(resource_params)
		@transitem.transaction_id = @transaction.id
		if @transitem.save
			redirect_to new_transaction_item_path(@outlet, @operator, @transaction, operator: params[:operator])
		else
			puts @transitem.errors.full_messages
		end
	end

	def destroy
	end

	private

	def resource_params
		params.require(:transaction_item).permit(:id, :itemable_type,:itemable_id, :amount_unit)
	end

	def get_operator
		if params[:operator] == "superadmin"
			@operator = User.find(params[:operator_id])
		elsif params[:operator] == "admin"
			@operator = Employee.find(params[:operator_id])
		elsif params[:operator] == "cashier"
			@operator = Employee.find(params[:operator_id])
		end
	end
end