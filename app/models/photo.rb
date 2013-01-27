class Photo < ActiveRecord::Base
  mount_uploader :url, PhotoUploader
  attr_accessible :description, :title, :url, :url_cache

  validates :url, :presence => true
  validates :title, :presence => true

  scope :ordered_photos, -> { order("created_at desc") }
end
