class EmployeesController < ApplicationController

	def index
		@employees = Employee.all
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
			redirect_to employees_path
		else
			render 'new'
		end
	end

	def destroy
		@employee = Employee.find(params[:id])
		if @employee.destroy
			redirect_to employees_path
		end
	end

	private

	def resource_params
		params.require(:employee).permit(:id, :name, :email, :pin, :type_employee)
	end
end