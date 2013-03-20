class AddCountInSales < ActiveRecord::Migration
  def up
    add_column :sales, :count, :integer
  end

  def down
    remove_column :sales, :count
  end
end
