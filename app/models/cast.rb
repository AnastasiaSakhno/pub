class Cast < ActiveRecord::Base
  has_many :materials, dependent: :destroy
  has_many :articles, through: :materials

  attr_accessible :name
end
