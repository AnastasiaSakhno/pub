class Sale < ActiveRecord::Base
  before_save :init_data
  attr_accessible :menu_id, :sale_date, :sale_price

  validates :menu_id, :presence => true

  def init_data
    self.sale_date ||= Date.today if new_record?
    self.sale_price ||= Menu.find(self.menu_id).price if new_record?
  end
end

