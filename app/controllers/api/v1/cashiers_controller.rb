class CashiersController < ApplicationController
	before_action :set_employee, only: [:pin_cashier, :cek_pin_cashier]
	before_action :set_user, only: [:pin_superadmin_cashier, :cek_pin_superadmin_cashier]
	before_action :set_outlet, only: [:operator, :pin_cashier, :pin_superadmin_cashier, :cek_pin_superadmin_cashier]
	layout false


	def index
	end

	def outlet
		@outlets = Outlet.where(user_id: current_user)

		render json: @outlets
	end

	def operator
		@employees = @outlet.permits.where(permitable_type: "Employee")

		render json: @employees
	end

	def pin_cashier
	end

	def cek_pin_cashier
		@pin = params[:pin]
		if @employee.cek_pin(@employee, @pin)
			flash[:success] = "You have logged in as a cashier, let's do as many transactions as possible!"
			redirect_to transactions_path(operator: "cashier")
		else
			redirect_to pin_cashier_path
		end
	end

	def pin_superadmin_cashier
	end

	def cek_pin_superadmin_cashier
		@pin = params[:pin]
		if @employee.cek_pin(@pin)
			flash[:success] = "Logged as cashier"
			redirect_to transactions_path(@outlet, @employee, operator: "superadmin")
		else
			redirect_to pin_superadmin_cashier_path
		end
	end
	
	private

	def set_outlet
		@outlet = Outlet.find(params[:outlet_id]) 
	end

	def set_user
		@employee = User.find(params[:operator_id])
	end

	def set_employee
		@employee = Employee.find(params[:operator_id])
	end
end