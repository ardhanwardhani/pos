class MembersController < ApplicationController

	def index
		@members = Member.all
	end

	def show
		@member = Member.find(params[:id])
		@transaction = Transaction.where(member_id: @member.id)
	end

	def new
		@member = Member.new
	end

	def create
		@member = Member.new(resource_params)
		@member.fill_user_id(current_user)
		if @member.save
			redirect_to members_path
		else
			render 'new'
		end
	end

	def edit
		@member = Member.find(params[:id])
	end

	def update
		@member = Member.find(params[:id])
		if @member.update(resource_params)
			redirect_to members_path
		else
			rende 'new'
		end
	end

	def destroy
		@member = Member.find(params[:id])
		if @member.destroy
			redirect_to members_path
		end
	end

	private

	def resource_params
		params.require(:member).permit(:id, :id_member, :name, :email, :telephone, :date_of_birth, :address, :zip_code, :note)
	end
end