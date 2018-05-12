class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.references :cast

      t.timestamps
    end
    add_index :materials, :cast_id
  end
end
