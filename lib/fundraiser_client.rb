require 'net/http'
require 'fundraiser_client/client'
require 'fundraiser_client/charity'
require 'fundraiser_client/config'
require 'fundraiser_client/connection'
require 'fundraiser_client/individual_page'

module FundraiserClient
  def self.new attributes = Rails.application.config.fundraiser_config.slice(:token, :base_uri)
    Client.new Config.new(attributes)
  end
end
