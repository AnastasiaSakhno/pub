class RemoveAddressColumnFromLocations < ActiveRecord::Migration
  def up
    remove_column :locations, :address
  end

  def down
    add_column :locations, :address, :string
  end
end
