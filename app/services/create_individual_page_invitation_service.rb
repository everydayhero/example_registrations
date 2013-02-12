require 'fundraiser_client'

# Invites registrants who want to fundraise via Everyday Hero.
#
# example:
#   CreateIndividualPageInvitationService.from_order order
#
# Only invites registrations who have selected to fundraise ignoring the
# primary registrant who had to authenticate through Everyday Hero when
# registering.
class CreateIndividualPageInvitationService
  attr_reader :order

  def initialize order
    @order = order
  end

  def self.from_order order
    service = new order
    service.create_invitations do |registration, invitation|
      registration.update_attribute :invitation_id, invitation.id
    end
  end

  def create_invitations &block
    client = FundraiserClient.new
    secondary_registrants.each do |registrant|
      payload = {
        email: registrant.email,
        full_name: [registrant.first_name, registrant.surname].join(' '),
        charity_id: registrant.charity.uid,
        target: registrant.target.dollars
      }

      block.call registrant, client.create_individual_page_invitation(payload)
    end
  end

  def secondary_registrants
    @secondary_registrants ||= order.secondary_registrants.with_fundraising('individual')
  end
end
