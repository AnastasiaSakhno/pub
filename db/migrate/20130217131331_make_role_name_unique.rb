class MakeRoleNameUnique < ActiveRecord::Migration
  def up
    remove_index :roles, :name
    add_index :roles, :name, :unique => true
  end

  def down
    remove_index :roles, :name, :unique => true
    add_index :roles, :name
  end
end
