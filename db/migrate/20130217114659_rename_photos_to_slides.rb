class RenamePhotosToSlides < ActiveRecord::Migration
  def change
    rename_table :photos, :slides
  end
end
