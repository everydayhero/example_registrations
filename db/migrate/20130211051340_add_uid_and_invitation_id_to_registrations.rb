class AddUidAndInvitationIdToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :uid, :integer
    add_column :registrations, :invitation_id, :integer
  end
end
