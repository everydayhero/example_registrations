module FundraiserClient
  class Config
    attr_reader :base_uri, :token, :version

    def initialize attributes = {}
      @token        = attributes.fetch(:token)
      @version      = attributes.fetch(:version, 'v1')
      self.base_uri = attributes.fetch(:base_uri, 'https://everydayhero.com')
    end

    private

    def base_uri= uri
      @base_uri = URI.parse(uri)
    end
  end
end
