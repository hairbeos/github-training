class Api::V1::Authentications::SessionsController < ApplicationController
  before_action :authenticate_user!, :except => [:create, :destroy]
  before_action :ensure_params_exist
  # respond_to :json

  def create
    resource = User.find_for_database_authentication(:email => user_params[:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(user_params[:password])
      sign_in(:user, resource)
      resource.ensure_authentication_token!
      render :json=> {:success=>true, :auth_token=>resource.authentication_token, :email=>resource.email}
      return
    end
    invalid_login_attempt
  end

  def destroy
    resource = User.find_for_database_authentication(:email => user_params[:email])
    resource.authentication_token = nil
    resource.save
    render :json=> {:success=>true}
  end

  protected
  def ensure_params_exist
    return unless params[:user].blank?
    render :json=>{:success=>false, :message=>"missing user parameter"}, :status=>422
  end

  def invalid_login_attempt
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
