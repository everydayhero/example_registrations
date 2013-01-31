class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :line_items_count, default: 0
      t.belongs_to :user
      t.string :token
      t.string :state

      t.timestamps
    end

    add_index :orders, :user_id
    add_index :orders, :token
  end
end
