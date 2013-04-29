class ProductsToArrivalsAfterChangingArrivalCountColumn < ActiveRecord::Migration
  def up
    Arrival.all.each do |arrival|
      product = Product.find(arrival.product_id)
      arrival.count = product.total_count
      arrival.save!
    end
  end

  def down
  end
end
