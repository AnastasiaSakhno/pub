class AddCityStreetBuildingToLocations < ActiveRecord::Migration
  def up
    add_column :locations, :city, :string
    add_column :locations, :street, :string
    add_column :locations, :building, :integer
  end

  def down
    remove_column :locations, :city, :string
    remove_column :locations, :street, :string
    remove_column :locations, :building, :integer
  end
end
