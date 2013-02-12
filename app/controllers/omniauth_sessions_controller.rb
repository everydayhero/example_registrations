require 'fundraiser_client'

class OmniauthSessionsController < ApplicationController
  def create
    client       = FundraiserClient.new
    registration = order.primary_registrant
    payload = {
      uid: auth_hash.uid,
      charity_id: registration.charity.uid,
      target: registration.target_cents,
      birthday: registration.birthday
    }
    individual_page = client.create_individual_page payload
    registration.update_attributes uid: auth_hash.uid

    redirect_to individual_page.url
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  def order
    @order ||= Order.find_by_token! session[:order_token]
  end
end
