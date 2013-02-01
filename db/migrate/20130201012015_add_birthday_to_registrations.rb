class AddBirthdayToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :birthday, :date
  end
end
