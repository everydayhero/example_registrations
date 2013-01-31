class ThanksController < ApplicationController
  helper_method :order

  def show
  end

  private

  def order
    @order ||= Order.find_by_token! session.delete(:order_token)
  end
end
