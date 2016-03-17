class MenuPage < ActiveRecord::Base
  mount_uploader :picture, MenuPageUploader
  attr_accessible :picture, :picture_cache

  validates :picture, :presence => true
end
