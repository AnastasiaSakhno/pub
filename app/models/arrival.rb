class Arrival < ActiveRecord::Base
  belongs_to :product
  belongs_to :user, :foreign_key => :receiver_id
  attr_accessible :count, :incoming_price, :sale_price, :product_id, :receiver_id

  validates :product_id, :presence => true
  validates :receiver_id, :presence => true
  validates :incoming_price, :presence => true
  validates :sale_price, :presence => true
  validates :count, :presence => true, :numericality => { :greater_than => 0 }
end
