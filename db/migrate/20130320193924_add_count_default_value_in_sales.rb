class AddCountDefaultValueInSales < ActiveRecord::Migration
  def change
    change_column :sales, :count, :integer, :default => 1
  end
end
