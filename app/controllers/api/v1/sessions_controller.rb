module Api::V1
	class SessionsController < Devise::SessionsController
		skip_before_action :require_no_authentication
		skip_before_action :verify_authenticity_token
		skip_before_action :authenticate_user!

		respond_to :json 
		# POST /resource/sign_in
		def create
			self.resource = User.where(email: user_params[:email]).first

			if resource && resource.valid_password?(user_params[:password])
			    set_flash_message!(:notice, :signed_in)
			    sign_in(resource_name, resource)

			    access_token = resource.generate_access_token

			    data = { :id => resource.id, :email => resource.email, :access_token => resource.access_token, :access_token_created_at => resource.access_token_created_at }
			    render json: data
			    #respond_with resource
			else
				render json: {message: "Unauthorized"}, status: 401
			end

		end

		# DELETE /resource/sign_out
		def destroy
			resource = current_user
			resource.invalidate_access_token
			head :ok
		end

	  	def resource_name
	  		devise_mapping.name.to_s.gsub("api_v1_", "").to_sym
	  	end

	  	private

	  	def user_params
	  		devise_parameter_sanitizer.sanitize(:sign_in)
	  		#params.require(:user).permit(:email, :password)
	  	end
	end
end