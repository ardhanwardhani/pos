class TransactionsController < ApplicationController
	layout false

	def index
		@outlet = Outlet.find(params[:outlet_id])
		@operator = Employee.find(params[:operator_id])
	end

	def show
	end

	def create
		@outlet = Outlet.find(params[:outlet_id])
		@operator = Employee.find(params[:operator_id])
		@transaction = Transaction.create(total: 0)
		if @transaction.save
			redirect_to new_transaction_item_path(@outlet, @operator, @transaction)
		end
	end
end