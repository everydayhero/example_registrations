class AddTeamNameToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :team_name, :string
  end
end
