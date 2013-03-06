class ChangeSalesColumnNames < ActiveRecord::Migration
  def up
    rename_column :sales, :sale_price, :price
    rename_column :sales, :sale_date, :date
  end

  def down
    rename_column :sales, :price, :sale_price
    rename_column :sales, :date, :sale_date
  end
end
