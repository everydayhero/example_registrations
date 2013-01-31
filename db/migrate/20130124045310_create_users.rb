class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :nickname
      t.string :email
      t.date :birthday
      t.string :token
      t.string :uid
      t.string :remember_token

      t.timestamps
    end

    add_index :users, :uid, unique: true
    add_index :users, :email, unique: true
  end
end
