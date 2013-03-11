class AddDateTimeColumnInSales < ActiveRecord::Migration
  def up
    # i made a mistake. i still need this column because people can add sale in some time after real sale
    # thanks god its still in development mode
    add_column :sales, :datetime, :datetime
  end

  def down
    remove_column :sales, :datetime
  end
end
