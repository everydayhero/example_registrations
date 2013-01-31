class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :amount_cents
      t.string :currency
      t.integer :order_id

      t.timestamps
    end

    add_index :transactions, :order_id
  end
end
