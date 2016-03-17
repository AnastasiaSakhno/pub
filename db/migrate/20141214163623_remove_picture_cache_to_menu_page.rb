class RemovePictureCacheToMenuPage < ActiveRecord::Migration
  def up
    remove_column :menu_pages, :picture_cache
  end

  def down
    add_column :menu_pages, :picture_cache, :string
  end
end
