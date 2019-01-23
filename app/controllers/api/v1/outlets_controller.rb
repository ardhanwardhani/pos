module Api::V1
	class OutletsController < BaseApiController
		
		before_action :set_outlet, only: [:show, :edit, :update, :destroy]

		# GET /outlets	
		def index
			@outlets = current_user.outlets

			render json: @outlets, each_serializer: OutletSerializer, status: 200
		end

		# GET /outlet/:id
		def show
			render json: @outlet, each_serializer: OutletSerializer, status: 200
		end

		# POST /outlets
		def create
			@outlet = Outlet.new(outlet_params)
			@outlet.user_id = current_user.id
			if @outlet.save
				render json: @outlet, status: :created, location: api_v1_outlet_path(@outlet)
			else
				puts @outlet.errors.full_messages
				render json: @outlet.errors, status: :unprocessable_entity
			end
		end

		# PUT/PATCH /outlet/:id
		def update
			if @outlet.update(outlet_params)
				render json: @outlet
			else
				render json: @outlet.errors, status: :unprocessable_entity
			end
		end

		# DELETE /outlets/:id
		def destroy
			@outlet.destroy
		end

		private

		def set_outlet
			@outlet = Outlet.find(params[:id])
		end

		def outlet_params
			params.require(:outlet).permit(:user_id, :name, :address, :city, :telephone)
		end
	end
end