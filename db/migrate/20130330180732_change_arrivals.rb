class ChangeArrivals < ActiveRecord::Migration
  def up
    rename_column :arrivals, :price, :incoming_price
    add_column :arrivals, :sale_price, :float
    add_column :arrivals, :receiver_id, :integer
  end

  def down
    rename_column :arrivals, :incoming_price, :price
    remove_column :arrivals, :sale_price
    remove_column :arrivals, :receiver_id
  end
end
