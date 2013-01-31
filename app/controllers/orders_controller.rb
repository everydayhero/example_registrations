class OrdersController < ApplicationController
  helper_method :form, :order

  def show
  end

  def new
  end

  def create
    order = Order.new
    order.add_biller current_user
    order.add_registration form.registration
    order.checkout
    session[:order_token] = order.token

    redirect_to confirm_path
  end

  private

  def form
    @form ||= RegistrationForm.new params.fetch(:form, Hash.new).merge(registrant: current_user)
  end

  def order
    @order ||= Order.find_by_token! session[:order_token]
  end
end
