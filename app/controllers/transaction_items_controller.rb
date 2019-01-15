class TransactionItemsController < ApplicationController
	layout false

	def new
		@outlet = Outlet.find(params[:outlet_id])
		@operator = Employee.find(params[:operator_id])
		@transaction = Transaction.find(params[:transaction_id])
		@trans_items = TransactionItem.where(transaction_id: @transaction.id)
		@transitem = TransactionItem.new
		@products = Product.where(user_id: current_user.id)
		@varians = Varian.where(user_id: current_user.id)
	end

	def create
		@outlet = Outlet.find(params[:outlet_id])
		@operator = Employee.find(params[:operator_id])
		@transaction = Transaction.find(params[:transaction_id])
		@trans_item = TransactionItem.where(transaction_id: @transaction.id)
		@transitem = TransactionItem.new(resource_params)

		@transitem.transaction_id = @transaction.id
		if @transitem.save
			redirect_to new_transaction_item_path(@outlet, @operator, @transaction)
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
end