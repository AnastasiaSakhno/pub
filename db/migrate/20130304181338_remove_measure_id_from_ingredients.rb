class RemoveMeasureIdFromIngredients < ActiveRecord::Migration
  def up
    remove_column :ingredients, :measure_id
  end

  def down
    add_column :ingredients, :measure_id, :integer
  end
end
