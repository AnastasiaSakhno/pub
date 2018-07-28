class ChangeMeasureIdToMeasureInProducts < ActiveRecord::Migration
  def up
    remove_column :products, :measure_id
    add_column :products, :measure, :string
  end

  def down
    remove_column :products, :measure
    add_column :products, :measure_id, :integer
  end
end
