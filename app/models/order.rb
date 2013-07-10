class Order < ActiveRecord::Base
  SALES_COUNT_MIN = 1
  has_many :sales, :dependent => :destroy
  has_many :menus, :through => :sales
  belongs_to :user, :foreign_key => :seller_id
  belongs_to :status
  before_create :init
  attr_accessible :client_name, :datetime, :seller_id, :table_number, :sales_attributes, :status_id
  accepts_nested_attributes_for :sales, :allow_destroy => true, :reject_if => lambda { |s| s[:menu_id].blank? }

  validates :seller_id, :presence => true
  validates :table_number, :presence => true
  validates :sales, :presence => true

  private

  def init
    self.datetime ||= Time.zone.now if new_record?
    self.status_id = Status.find_by_name(:new).id
  end

  public

  def new?
    self.status_id == Status.find_by_name(:new).id
  end

  def close
    self.status_id = Status.find_by_name(:closed).id
    self.save
  end
end
