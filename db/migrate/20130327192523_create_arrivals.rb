class CreateArrivals < ActiveRecord::Migration
  def change
    create_table :arrivals do |t|
      t.integer :product_id
      t.float :price
      t.integer :count

      t.timestamps
      t.belongs_to :product
    end
  end
end
