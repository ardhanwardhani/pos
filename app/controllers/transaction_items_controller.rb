class TransactionItemsController < ApplicationController
	layout false

	def new
		@outlet = Outlet.find(params[:outlet_id])
		@operator = Employee.find(params[:operator_id])
		@transaction = Transaction.find(params[:transaction_id])
		@trans_items = TransactionItem.where(transaction_id: @transaction.id)
		@total = 0
		@trans_item.each do |i|
			debugger
			product = i.itemable
			@total += i.amount_unit.to_i * product.price.to_i
		end

		@transitem = TransactionItem.new
		@products = Product.where("user_id = ? AND status = ?", current_user, "on_sale")
		@varians = Varian.where("user_id = ? AND status = ?", current_user, "on_sale")
	end

	def create
		@outlet = Outlet.find(params[:outlet_id])
		@operator = Employee.find(params[:operator_id])
		@transaction = Transaction.find(params[:transaction_id])
		@trans_item = TransactionItem.where(transaction_id: @transaction.id)
		@trans_item.each do |i|
			debugger
			product = i.itemable
			@transaction.total.to_i += i.amount_unit.to_i * product.price.to_i
		end



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


	# Superadmin as cashier
	def new_admin
		@outlet = Outlet.find(params[:outlet_id])
		@operator = User.find(params[:operator_id])
		@transaction = Transaction.find(params[:transaction_id])
		@trans_items = TransactionItem.where(transaction_id: @transaction.id)
		@transitem = TransactionItem.new
		@products = Product.where("user_id = ? AND status = ?", current_user, "on_sale")
		@varians = Varian.where("user_id = ? AND status = ?", current_user, "on_sale")
		render :new
	end

	def create_admin
		@outlet = Outlet.find(params[:outlet_id])
		@operator = User.find(params[:operator_id])
		@transaction = Transaction.find(params[:transaction_id])
		@trans_item = TransactionItem.where(transaction_id: @transaction.id)
		@transitem = TransactionItem.new(resource_params)

		@transitem.transaction_id = @transaction.id
		if @transitem.save
			redirect_to admin_new_transaction_item_path(@outlet, @operator, @transaction)
		else
			puts @transitem.errors.full_messages
		end
	end

	def destroy_admin
	end

	private

	def resource_params
		params.require(:transaction_item).permit(:id, :itemable_type,:itemable_id, :amount_unit)
	end
end