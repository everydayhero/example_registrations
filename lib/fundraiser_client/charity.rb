module FundraiserClient
  class Charity
    attr_accessor :id, :name

    def initialize attributes = {}
      attributes.each do |attribute, value|
        self.public_send "#{attribute}=", value
      end if attributes
    end

    def attributes
      {id: id, name: name}
    end
  end
end
