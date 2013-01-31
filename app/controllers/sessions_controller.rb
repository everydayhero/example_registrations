class SessionsController < ApplicationController
  def create
    raise user.inspect
    sign_in user
    redirect_to register_path
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def user
    @user ||= User.find_or_create_from_auth_hash auth_hash
  end

  def auth_hash
    @auth_hash ||= request.env['omniauth.auth']
  end
end
