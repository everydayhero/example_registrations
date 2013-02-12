class JoinTeamOrdersController < ApplicationController
  def new
    raise
  end

  def something
    current_user.add_giving_passport auth_hash
    client       = FundraiserClient.new
    registration = order.primary_registration
    payload = {
      uid: current_user.uid,
      campaign_id: Rails.application.config.fundraiser_config.fetch(:campaign_id),
      charity_id: registration.charity.uid,
      target: '700',
      birthday: registration.birthday,
      token: token
    }
    individual_page = client.create_individual_page payload
    registration.create_individual_page data: individual_page.attributes
  end

  def token
    params[:token]
  end
end
