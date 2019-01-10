class EmployeesController < ApplicationController

	def index
		@employees = Employee.where(user_id: current_user.id)
	end

	def show
		@employee = Employee.find(params[:id])
	end

	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(resource_params)
		if @employee.save
			flash[:success] = "Employee successfully added"
			redirect_to employees_path
		else
			render 'new'
		end
	end

	def edit
		@employee = Employee.find(params[:id])
	end

	def update
		@employee = Employee.find(params[:id])
		if @employee.update(resource_params)
			flash[:success] = "Employee data has been changed"
			redirect_to employees_path
		else
			render 'new'
		end
	end

	def destroy
		@employee = Employee.find(params[:id])
		if @employee.destroy
			flash[:info] = "Employess data has been deleted"
			redirect_to employees_path
		end
	end

	private

	def resource_params
		params.require(:employee).permit(:id, :name, :email, :pin, :type_employee)
	end
end