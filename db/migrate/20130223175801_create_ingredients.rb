class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :product_id
      t.integer :menu_id
      t.float :amount
      t.integer :measure_id

      t.timestamps
    end
  end
end
