class AddPictureInMenu < ActiveRecord::Migration
  def up
    add_column :menus, :picture, :string
  end

  def down
    remove_column :menus, :picture
  end
end
