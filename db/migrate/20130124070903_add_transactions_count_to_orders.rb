class AddTransactionsCountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :transactions_count, :integer, default: 0
  end
end
