class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.integer :category_id
      t.float :price

      t.timestamps
    end
  end
end
