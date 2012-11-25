class Poster < ActiveRecord::Base
  attr_accessible :approximate_date, :context, :title, :url

  validates :url, :presence => true
  validates :title, :presence => true
  validates :context, :presence => true
  validates :approximate_date, :presence => true

  scope :ordered_posters, -> { order(:approximate_date) }
end
