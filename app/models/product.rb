class Product < ActiveRecord::Base
  before_create :init
  attr_accessible :amount_per_one, :description, :incoming_price, :measure, :name, :sale_price, :total_count
  has_many :ingredients
  has_many :menus, :through => :ingredients

  validates :amount_per_one, :presence => true
  validates :measure, :presence => true, :inclusion => {:in => Constants::Measure.all,
                                                        :message => "%{value} is not a valid measure"}
  validates :name, :presence => true
  validates :sale_price, :presence => true
  validates :incoming_price, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :sale_price, :presence => true, :numericality => {:greater_than_or_equal_to => 0}

  private

  def init
    self.total_count ||= 0 if new_record?
  end

  def self.clear
    ProductMailer.clear_products(User.current_user, I18n.locale).deliver
    Product.all.each do |product|
      product.total_count = 0
      product.save!
    end
  end
end
