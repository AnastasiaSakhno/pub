class Material < ActiveRecord::Base
  belongs_to :cast
  has_many :articles, dependent: :destroy

  attr_accessible :name
end
