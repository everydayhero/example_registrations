module FundraiserClient
  class JoinTeamInvitation
    attr_accessor :id, :email, :accepted_at, :team_page_id

    def initialize attributes = {}
      attributes.each do |attribute, value|
        self.public_send "#{attribute}=", value
      end if attributes
    end
  end
end
