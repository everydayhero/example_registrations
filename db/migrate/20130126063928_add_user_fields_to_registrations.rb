class AddUserFieldsToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :first_name, :string
    add_column :registrations, :surname, :string
    add_column :registrations, :nickname, :string
    add_column :registrations, :gender, :string
  end
end
