class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
