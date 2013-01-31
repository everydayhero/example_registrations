require 'fundraiser_client'

namespace :import do
  task charities: :environment do
    client        = FundraiserClient.new
    charities     = client.get_charities Rails.application.config.fundraiser_config.fetch(:campaign_id)
    existing_uids = Charity.where(uid: charities.map(&:id)).pluck :uid
    new_charities = charities.reject { |charity| existing_uids.include?(charity.id) }

    new_charities.each do |charity|
      Charity.create uid: charity.id, name: charity.name
    end

    new_charities
  end
end
