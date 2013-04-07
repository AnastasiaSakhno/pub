class ProductsToArrivalsGoOnce < ActiveRecord::Migration
  def up
    Product.all.each do |product|
      arrival = Arrival.new
      arrival.product_id = product.id
      arrival.incoming_price = product.incoming_price
      arrival.sale_price = product.sale_price
      arrival.count = product.total_count
      arrival.receiver_id = User.find_by_email('profession@i.ua').id
      arrival.save!
    end
  end

  def down
  end
end
