module FundraiserClient
  class Client
    attr_writer :connection

    def initialize config
      @config = config
    end

    def connection
      @connection ||= Connection.new @config
    end

    def create_individual_page attributes
      response   = connection.post '/pages', attributes
      attributes = response['page'].slice('id', 'name', 'slug')
      attributes.merge! response['meta'].slice('url')

      IndividualPage.new attributes
    end

    def create_team attributes
      response = connection.post '/teams', attributes

      TeamPage.new response['page'].slice('id', 'name', 'slug')
    end

    def create_individual_page_invitation attributes
      response = connection.post '/individual-pages/invitations', attributes

      CreateIndividualPageInvitation.new response['create_individual_page_invitation'].slice('id', 'email', 'accepted_at')
    end

    def create_join_team_invitation id, attributes
      response = connection.post "/team-pages/#{id}/invitations", attributes

      response['create_individual_page_invitations'].map do |attributes|
        JoinTeamInvitation.new attributes.slice('id', 'email', 'accepted_at', 'team_page_id')
      end
    end

    def get_charities campaign_id = nil
      response = connection.get '/charities', campaign_id: campaign_id
      response['charities'].map { |attributes| Charity.new(attributes.slice('id', 'name')) }
    end
  end
end
