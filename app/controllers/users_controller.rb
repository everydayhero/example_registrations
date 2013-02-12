class UsersController < ApplicationController
  def create
    if new_user.save
      sign_in new_user
      redirect_to register_path
    else
      render :new
    end
  end

  def new_user
    @new_user ||= User.new create_params
  end
  helper_method :new_user

  def create_params
    params.require(:user).permit :full_name, :email, :birthday,
                                 :password, :password_confirmation
  end
end
