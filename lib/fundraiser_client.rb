require 'net/http'
require 'fundraiser_client/client'
require 'fundraiser_client/charity'
require 'fundraiser_client/config'
require 'fundraiser_client/connection'
require 'fundraiser_client/individual_page'
require 'fundraiser_client/team_page'
require 'fundraiser_client/create_individual_page_invitation'
require 'fundraiser_client/join_team_invitation'

module FundraiserClient
  def self.new attributes = Rails.application.config.fundraiser_config.slice(:token, :base_uri)
    Client.new Config.new(attributes)
  end
end
