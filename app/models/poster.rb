class Poster < ActiveRecord::Base
  mount_uploader :url, PosterUploader
  attr_accessible :approximate_date, :context, :title, :url, :url_cache

  validates :url, :presence => true
  validates :title, :presence => true
  validates :context, :presence => true
  validates :approximate_date, :presence => true

  scope :ordered_posters, -> { order(:approximate_date) }
end
