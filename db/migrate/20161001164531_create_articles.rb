class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.text :desc
      t.references :material

      t.timestamps
    end
    add_index :articles, :material_id
  end
end
