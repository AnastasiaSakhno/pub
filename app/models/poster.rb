class Poster < ActiveRecord::Base
  attr_accessible :approximate_date, :context, :title, :url
end
