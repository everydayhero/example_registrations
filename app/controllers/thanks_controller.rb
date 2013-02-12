class ThanksController < ApplicationController
  helper_method :order

  def show
    if order.secondary_registrants.already_fundraising('individual').empty?
      CreateIndividualPageInvitationService.from_order order
    end

    session[:order_token] = order.token
  end

  def order
    @order ||= Order.find params[:order_id]
  end
end
