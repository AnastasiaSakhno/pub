class AddCostToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :cost, :float, null: false, default: 0.0
  end
end
