require 'fundraiser_client'

class PaymentsController < ApplicationController
  helper_method :order

  def create
    order.add_transaction Transaction.new
    order.paid

    redirect_to thanks_path(order_id: order)
  end

  private

  def order
    @order ||= Order.find params[:order_id]
  end
end
