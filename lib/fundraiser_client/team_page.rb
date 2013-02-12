module FundraiserClient
  class TeamPage
    attr_accessor :id, :name, :slug, :url

    def initialize attributes = {}
      attributes.each do |attribute, value|
        self.public_send "#{attribute}=", value
      end if attributes
    end
  end
end
