class AddRegoFieldsToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :distance, :string
    add_column :registrations, :fundraiser, :string
    add_column :registrations, :charity_id, :integer
  end
end
