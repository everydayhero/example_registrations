module FundraiserClient
  class IndividualPage
    attr_accessor :id, :name, :slug

    def initialize attributes = {}
      attributes.each do |attribute, value|
        self.public_send "#{attribute}=", value
      end if attributes
    end

    def attributes
      {id: id, name: name, slug: slug}
    end
  end
end
