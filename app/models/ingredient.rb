class Ingredient < ActiveRecord::Base
  attr_accessible :amount, :measure_id, :menu_id, :product_id
  belongs_to :menu
  belongs_to :product

  validates :amount, :presence => true
  validates :measure_id, :presence => true
  validates :menu_id, :presence => true
  validates :product_id, :presence => true
end
