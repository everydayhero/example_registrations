require 'fundraiser_client'

class PaymentsController < ApplicationController
  helper_method :order

  def new
  end

  def create
    order.add_transaction Transaction.new
    order.paid
    client       = FundraiserClient.new
    registration = order.primary_registration
    payload = {
      uid: current_user.uid,
      campaign_id: Rails.application.config.fundraiser_config.fetch(:campaign_id),
      charity_id: primary_registration.charity.uid,
      target: '700',
      birthday: current_user.birthday
    }
    individual_page = client.create_individual_page payload
    registration.create_individual_page data: individual_page.attributes

    redirect_to thanks_path
  end

  private

  def order
    @order ||= Order.find_by_token! session[:order_token]
  end
end
