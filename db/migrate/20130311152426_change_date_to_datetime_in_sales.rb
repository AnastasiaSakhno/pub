class ChangeDateToDatetimeInSales < ActiveRecord::Migration
  def up
    # i decided remove this column because i have regular created_at column. its enough
    remove_column :sales, :date
  end

  def down
    add_column :sales, :date, :date
  end
end
