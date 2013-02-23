class Category < ActiveRecord::Base
  attr_accessible :name
  belongs_to :menus

  validates :name, :presence => true
end
