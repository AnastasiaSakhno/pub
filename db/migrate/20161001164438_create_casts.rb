class CreateCasts < ActiveRecord::Migration
  def change
    create_table :casts do |t|
      t.string :name

      t.timestamps
    end
  end
end
