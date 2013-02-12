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

    if registration.fundraise_as('team')
      team_page = client.create_team individual_page_id: individual_page.id,
                                     name: registration.team_name

      order.secondary_registrants.with_fundraising('team').each do |registrant|
        payload = {
          email: registrant.email,
          full_name: [registrant.first_name, registrant.surname].join(' '),
          charity_id: registrant.charity.uid,
          target: registrant.target.dollars
        }

        invitation = client.create_join_team_invitation team_page.id, payload

        registration.update_attribute :invitation_id, invitation.id
      end
    end

    redirect_to individual_page.url
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  def order
    @order ||= Order.find_by_token! session[:order_token]
  end
end
