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
      response = connection.post '/pages', attributes
      IndividualPage.new response['page'].slice('id', 'name', 'slug')
    end

    def get_charities campaign_id = nil
      response = connection.get '/charities', campaign_id: campaign_id
      response['charities'].map { |attributes| Charity.new(attributes.slice('id', 'name')) }
    end
  end
end
