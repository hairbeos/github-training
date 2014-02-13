class ApplicationController < ActionController::Base
  include ActionController::MimeResponds
  include ActionController::StrongParameters
  include ActionController::ImplicitRender

  include Devise::Controllers::Helpers
  include CanCan::ControllerAdditions

  respond_to :json

  # Handle authorization exception from CanCan
  rescue_from CanCan::AccessDenied do |exception|
    render json: { success: false, message: exception.message }
  end

  # Handle RecordNotFound errors
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { errors: [exception.message] }, status: :unprocessable_entity
  end

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.where(authentication_token: params[:auth_token]).first
  end
end
