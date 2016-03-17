class AddPictureCacheToMenuPage < ActiveRecord::Migration
  def change
    add_column :menu_pages, :picture_cache, :string
  end
end
