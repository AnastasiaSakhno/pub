class RenameLongituteToLongitudeInLocations < ActiveRecord::Migration
  def up
    rename_column :locations, :longitute, :longitude
  end

  def down
    rename_column :locations, :longitude, :longitute
  end
end
