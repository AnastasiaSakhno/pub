class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :incoming_price
      t.float :sale_price
      t.float :total_count
      t.float :amount_per_one
      t.integer :measure_id

      t.timestamps
    end
  end
end
