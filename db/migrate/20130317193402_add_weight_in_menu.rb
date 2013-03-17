class AddWeightInMenu < ActiveRecord::Migration
  def up
    add_column :menus, :weight, :float
  end

  def down
    remove_column :menus, :weight
  end
end
