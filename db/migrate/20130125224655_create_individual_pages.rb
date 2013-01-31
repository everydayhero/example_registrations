class CreateIndividualPages < ActiveRecord::Migration
  def change
    create_table :individual_pages do |t|
      t.belongs_to :registration, index: true
      t.text :data

      t.timestamps
    end
  end
end
