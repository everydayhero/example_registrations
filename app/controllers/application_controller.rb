class ApplicationController < ActionController::Base
  attr_writer :current_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?

  def current_user
    @current_user ||= retrieve_user
  end

  def sign_in user
    user.generate_remember_token
    cookies.signed[:user_id] = {
      value: [user.id, user.remember_token]
    }
    self.current_user = user
  end

  def sign_out
    current_user.reset_remember_token
    cookies.delete :user_id
    self.current_user = nil
  end

  def signed_in?
    !!current_user
  end

  protected

  def retrieve_user
    id, token = cookies.signed[:user_id]
    User.find_by_id_and_remember_token id, token
  end
end
