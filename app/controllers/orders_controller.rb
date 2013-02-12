class OrdersController < ApplicationController
  helper_method :registration, :order

  def create
    order = Order.new
    order.add_registration registration
    order.checkout

    redirect_to confirm_path(order_id: order)
  end

  def update
    order.add_registration registration
    order.save

    redirect_to confirm_path(order_id: order)
  end

  private

  def registration
    @registration ||= Registration.new create_params
  end

  def create_params
    params.require(:registration).permit :first_name, :surname,
      :nickname, :gender, :birthday, :fundraiser, :charity_id, :target,
      :distance, :email
  end

  def order
    @order ||= Order.find params[:order_id]
  end
end
