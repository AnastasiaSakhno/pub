class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :menu_id
      t.float :sale_price
      t.date :sale_date

      t.timestamps
    end
  end
end
