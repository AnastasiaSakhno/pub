class RemoveAllProducts < ActiveRecord::Migration
  def up
    Arrival.destroy_all
    Product.all.each do |product|
      product.total_count = 0
      product.save!
    end
  end

  def down
  end
end
