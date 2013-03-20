class AddNameColumnInUsers < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    add_column :users, :middle_name, :string
    add_column :users, :last_name, :string
  end

  def down
    remove_column :users, :name
    remove_column :users, :middle_name
    remove_column :users, :last_name
  end
end
