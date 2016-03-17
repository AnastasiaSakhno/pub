class Arrival < ActiveRecord::Base
  belongs_to :product
  belongs_to :user, :foreign_key => :receiver_id
  before_create :init, :add_products
  attr_accessible :count, :incoming_price, :sale_price, :product_id, :receiver_id

  validates :product_id, :presence => true
  validates :receiver_id, :presence => true
  validates :count, :presence => true, :numericality => { :greater_than => 0 }

  private

  def init
    self.incoming_price ||= Product.find(self.product_id).incoming_price if new_record?
    self.sale_price ||= Product.find(self.product_id).sale_price if new_record?
  end

  def add_products
    product = Product.find(self.product_id)
    product.total_count += self.count
    product.incoming_price = self.incoming_price
    product.sale_price = self.sale_price
    product.save!
  end
end
