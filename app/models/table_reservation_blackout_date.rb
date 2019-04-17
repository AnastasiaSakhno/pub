class TableReservationBlackoutDate < ActiveRecord::Base
  attr_accessible :date, :hall


  scope :for_date, ->(date) { where(date: date) }
  scope :for_hall, ->(hall) { where(hall: hall) }
end
