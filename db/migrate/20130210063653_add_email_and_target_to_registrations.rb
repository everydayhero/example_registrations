class AddEmailAndTargetToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :email, :string
    add_column :registrations, :target_cents, :integer, default: 0
  end
end
