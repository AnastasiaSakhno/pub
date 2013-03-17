class Menu < ActiveRecord::Base
  attr_accessible :category_id, :name, :price, :weight
  has_many :ingredients
  has_many :products, :through => :ingredients
  has_many :sales

  validates :name, :presence => true
  validates :category_id, :presence => true
  validates :price, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }

  scope :ordered_by_category, -> { order("category_id desc") }
end
