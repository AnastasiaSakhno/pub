class Status < ActiveRecord::Base
  has_many :orders
  attr_accessible :name
end