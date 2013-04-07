class Arrival < ActiveRecord::Base
  belongs_to :product
  belongs_to :user, :foreign_key => :receiver_id
  before_create :add_products
  attr_accessible :count, :incoming_price, :sale_price, :product_id, :receiver_id

  validates :product_id, :presence => true
  validates :receiver_id, :presence => true
  validates :incoming_price, :presence => true
  validates :sale_price, :presence => true
  validates :count, :presence => true, :numericality => { :greater_than => 0 }

  private

  def add_products
    product = Product.find(self.product_id)
    product.total_count += self.count
    product.incoming_price = self.incoming_price
    product.sale_price = self.sale_price
    product.save!
  end
end
