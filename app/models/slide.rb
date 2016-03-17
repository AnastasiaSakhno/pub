class Slide < ActiveRecord::Base
  mount_uploader :url, SlideUploader
  attr_accessible :description, :title, :url, :url_cache

  validates :url, :presence => true
  validates :title, :presence => true

  scope :ordered_slides, -> { order("created_at desc") }
end
