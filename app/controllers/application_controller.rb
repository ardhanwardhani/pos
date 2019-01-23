class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception
  before_action :configuration_permitted_parameters, if: :devise_controller?

  layout :setup_layout

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  private

  def configuration_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :telephone, :province, :city, :pin])
  end

  def setup_layout
  	false if devise_controller?
  end
end