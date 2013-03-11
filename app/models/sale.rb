class Sale < ActiveRecord::Base
  before_save :init, :debit_products
  attr_accessible :menu_id, :datetime, :price

  validates :menu_id, :presence => true

  private

  def init
    self.datetime ||= DateTime.now if new_record?
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

  scope :ordered_sales, -> { order("created_at desc") }
end

