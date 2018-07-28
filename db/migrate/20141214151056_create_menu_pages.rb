class CreateMenuPages < ActiveRecord::Migration
  def change
    create_table :menu_pages do |t|
      t.string :picture

      t.timestamps
    end
  end
end
