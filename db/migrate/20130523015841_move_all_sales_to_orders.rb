class MoveAllSalesToOrders < ActiveRecord::Migration
  def up
    # add order_id to sales
    add_column :sales, :order_id, :integer
    # move sales to orders and set order_id in each sale
    Sale.all.each do |sale|
      order = Order.new
      order.seller_id = sale.seller_id
      order.client_name = sale.client_name
      order.datetime = sale.datetime
      order.save!
      sale.order_id = order.id
      sale.save!
    end
    # remove seller_id, client_name and datetime from sales
    remove_column :sales, :seller_id
    remove_column :sales, :client_name
    remove_column :sales, :datetime
  end

  def down
    # add seller_id, client_name and datetime to sales
    add_column :sales, :seller_id, :integer
    add_column :sales, :client_name, :string
    add_column :sales, :datetime, :datetime
    # move orders back to sales
    Order.all.each do |order|
      order.sales.each do |sale|
        sale.seller_id = order.seller_id
        sale.client_name = order.client_name
        sale.datetime = order.datetime
        sale.save!
      end
    end
    Order.destroy_all
    # remove order_id from sales
    remove_column :sales, :order_id
  end
end
