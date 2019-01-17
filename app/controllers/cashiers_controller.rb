class CashiersController < ApplicationController
	layout false

	def index
	end

	def outlet
		#@user = User.find(params[:user_id])
		@outlets = Outlet.where(user_id: current_user.id)
	end

	def operator
		#@user = User.find(params[:user_id])
		@outlet = Outlet.find(params[:outlet_id]) 
		@employees = Outlet.find(params[:outlet_id]).employees
	end

	def pin_cashier
		#@user = User.find(params[:user_id])
		@outlet = Outlet.find(params[:outlet_id]) 
		@employee = Employee.find(params[:operator_id])
	end

	def cek_pin_cashier
		@employee = Employee.find(params[:operator_id])
		@pin = params[:pin]
		if @employee.cek_pin(@employee, @pin)
			flash[:success] = "You have logged in as a cashier, let's do as many transactions as possible!"
			redirect_to transactions_path(operator: "cashier")
		else
			redirect_to pin_cashier_path
		end
	end

	def pin_superadmin_cashier
		#@user = User.find(params[:user_id])
		@outlet = Outlet.find(params[:outlet_id]) 
		@employee = User.find(params[:operator_id])
	end

	def cek_pin_superadmin_cashier
		@employee = User.find(params[:operator_id])
		@outlet = Outlet.find(params[:outlet_id])
		@pin = params[:pin]
		if @employee.cek_pin(@employee, @pin)
			flash[:success] = "Logged as cashier"
			redirect_to transactions_path(@outlet, @employee, operator: "superadmin")
		else
			redirect_to pin_superadmin_cashier_path
		end
	end

	def pin_superadmin
	end

	def cek_pin_superadmin
		@employee = User.find(params[:id])
		@pin = params[:pin]
		if @employee.cek_pin(@employee, @pin)
			redirect_to products_path
		end
	end
end