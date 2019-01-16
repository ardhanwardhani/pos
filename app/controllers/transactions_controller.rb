class TransactionsController < ApplicationController
	layout false

	def index
		@outlet = Outlet.find(params[:outlet_id])
		@operator = Employee.find(params[:operator_id])
		@saved_trans = Transaction.where("user_id = ? AND status = ?", current_user, "save")
	end

	def show
	end

	def create
		@outlet = Outlet.find(params[:outlet_id])
		@operator = Employee.find(params[:operator_id])
		@transaction = Transaction.new(total: 0, user_id: current_user.id)
		if @transaction.save
			redirect_to new_transaction_item_path(@outlet, @operator, @transaction)
		end
	end

	def save_transaction
		@outlet = Outlet.find(params[:outlet_id])
		@operator = Employee.find(params[:operator_id])
		@transaction = Transaction.find(params[:transaction_id])
		@transaction.save_trans
		if @transaction.save
			redirect_to transactions_path(@outlet, @operator)
		end
	end

	def pay_transaction
		@outlet = Outlet.find(params[:outlet_id])
		@operator = Employee.find(params[:operator_id])
		@transaction = Transaction.find(params[:transaction_id])
		@transaction.pay_trans
		if @transaction.save
			redirect_to transactions_path(@outlet, @operator)
		end
	end

	# Superadmin as Cashier
	def index_admin
		@outlet = Outlet.find(params[:outlet_id])
		@operator = User.find(params[:operator_id])
		@saved_trans = Transaction.where("user_id = ? AND status = ?", current_user, "save")
		render :index
	end

	def show
	end

	def create_admin
		@outlet = Outlet.find(params[:outlet_id])
		@operator = User.find(params[:operator_id])
		@transaction = Transaction.new(total: 0, user_id: current_user.id)
		if @transaction.save
			redirect_to admin_new_transaction_item_path(@outlet, @operator, @transaction)
		end
	end

	def save_transaction_admin
		@outlet = Outlet.find(params[:outlet_id])
		@operator = User.find(params[:operator_id])
		@transaction = Transaction.find(params[:transaction_id])
		@transaction.save_trans
		if @transaction.save
			redirect_to admin_transactions_path(@outlet, @operator)
		end
	end

	def pay_transaction_admin
		@outlet = Outlet.find(params[:outlet_id])
		@operator = User.find(params[:operator_id])
		@transaction = Transaction.find(params[:transaction_id])
		@transaction.pay_trans
		if @transaction.save
			redirect_to admin_transactions_path(@outlet, @operator)
		end
	end
end