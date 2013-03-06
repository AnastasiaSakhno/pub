class Product < ActiveRecord::Base
  attr_accessible :amount_per_one, :description, :incoming_price, :measure, :name, :sale_price, :total_count
  has_many :ingredients
  has_many :menus, :through => :ingredients

  validates :amount_per_one, :presence => true
  validates :measure, :presence => true
  validates :name, :presence => true
  validates :sale_price, :presence => true
  validates :total_count, :presence => true
  validates :incoming_price, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :sale_price, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
end
