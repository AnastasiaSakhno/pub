class AllOrdersAreClosed < ActiveRecord::Migration
  def up
    Order.all.each do | order|
      order.close
    end
  end

  def down
  end
end
