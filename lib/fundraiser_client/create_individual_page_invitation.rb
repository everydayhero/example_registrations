module FundraiserClient
  class CreateIndividualPageInvitation
    attr_accessor :id, :email, :accepted_at

    def initialize attributes = {}
      attributes.each do |attribute, value|
        self.public_send "#{attribute}=", value
      end if attributes
    end
  end
end
