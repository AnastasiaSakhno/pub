class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :seller_id
      t.string :client_name
      t.datetime :datetime

      t.timestamps
    end
  end
end
