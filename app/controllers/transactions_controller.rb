class TransactionsController < ApplicationController
	include ApplicationHelper
	layout false
	before_action :get_operator

	def index
		@outlet = Outlet.find(params[:outlet_id])
		@saved_trans = Transaction.where("user_id = ? AND status = ?", current_user, "save")
	end

	def show
		@outlet = Outlet.find(params[:outlet_id])
		@transaction = Transaction.find(params[:transaction_id])
		@trans_items = TransactionItem.where(transaction_id: @transaction.id)
	end

	def create
		@outlet = Outlet.find(params[:outlet_id])
		@last = Transaction.last
		@transaction = Transaction.new
		@transaction.fill_field_data(@outlet, @operator, current_user, @last)
		if @transaction.save
			redirect_to new_transaction_item_path(@outlet, @operator, @transaction, operator: get_operator_type(@operator))
		else
			puts @ttransaction.errors.full_messages
			redirect_to new_transaction_path(@outlet, @operator, @transaction, operator: get_operator_type(@operator))
		end
	end

	def save_transaction
		@outlet = Outlet.find(params[:outlet_id])
		@transaction = Transaction.find(params[:transaction_id])
		@transaction.save_trans
		if @transaction.save
			redirect_to transactions_path(@outlet, @operator, operator: get_operator_type(@operator))
		end
	end

	def payment_transaction
		@bussiness = Bussiness.find_by(user_id: current_user.id)
		@outlet = Outlet.find(params[:outlet_id])
		@transaction = Transaction.find(params[:transaction_id])
		@trans_items = TransactionItem.where(transaction_id: @transaction.id)
	end

	def pay_transaction
		@outlet = Outlet.find(params[:outlet_id])
		@transaction = Transaction.find(params[:transaction_id])
		@transaction.pay_trans
		if @transaction.save
			redirect_to payment_transaction_path(@outlet, @operator, @transaction, operator: get_operator_type(@operator))
		else
			puts @transaction.errors.full_messages
		end
	end

	def transaction_history
		@outlet = Outlet.find(params[:outlet_id])
		@transactions = Transaction.where("user_id = ? AND status = ?", current_user, "pay")
	end

	private

	def get_operator
		if params[:operator] == "superadmin"
			@operator = User.find(params[:operator_id])
		elsif params[:operator] == "cashier"
			@operator = Employee.find(params[:operator_id])
		end
	end
end