class Menu < ActiveRecord::Base
  mount_uploader :picture, MenuUploader
  attr_accessible :category_id, :name, :price, :weight, :picture, :picture_cache
  has_many :ingredients
  has_many :products, :through => :ingredients
  has_many :sales
  has_many :orders, :through => :sales

  validates :name, :presence => true
  validates :category_id, :presence => true
  validates :price, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }

  scope :ordered_by_category, -> { order("category_id desc") }
end
