class SessionsController < ApplicationController
  def create
    if user
      sign_in user
      redirect_to register_path
    else
      flash.now.alert = 'Authentication failed'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  def user
    @user ||= User.authenticate params.fetch(:session, Hash.new).slice(:email, :password)
  end
end
