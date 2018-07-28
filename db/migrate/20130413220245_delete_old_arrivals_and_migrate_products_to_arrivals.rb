class DeleteOldArrivalsAndMigrateProductsToArrivals < ActiveRecord::Migration
  def up
    Arrival.destroy_all
    Product.all.each do |product|
      count = product.total_count
      if count > 0
        arrival = Arrival.new
        arrival.product_id = product.id
        arrival.incoming_price = product.incoming_price
        arrival.sale_price = product.sale_price
        arrival.count = count
        arrival.receiver_id = User.find_by_email('profession@i.ua').id
        arrival.save!
      end
    end
  end

  def down
  end
end
