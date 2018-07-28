class AddTableNumberInOrders < ActiveRecord::Migration
  def up
    add_column :orders, :table_number, :integer
  end

  def down
    remove_column :orders, :table_number
  end
end
