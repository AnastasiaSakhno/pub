class Sale < ActiveRecord::Base
  belongs_to :menu
  belongs_to :user, :foreign_key => :seller_id
  before_save :init, :debit_products
  attr_accessible :menu_id, :datetime, :price, :seller_id, :client_name

  validates :menu_id, :presence => true
  validates :seller_id, :presence => true

  private

  def init
    self.datetime ||= Time.zone.now if new_record?
    self.price ||= Menu.find(self.menu_id).price if new_record?
  end

  def debit_products
    ingredients = Ingredient.find_all_by_menu_id(self.menu_id)
    ingredients.each do |ingredient|
      product = Product.find(ingredient.product_id)
      product.total_count -= product.amount_per_one * ingredient.amount
      product.save
    end
  end

  scope :ordered, -> { order("created_at desc") }
end

