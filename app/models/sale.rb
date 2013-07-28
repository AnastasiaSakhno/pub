class Sale < ActiveRecord::Base
  belongs_to :order
  belongs_to :menu
  before_create :init, :debit_products
  before_destroy :restore_products
  attr_accessible :menu_id, :price, :count, :order_id

  validates :menu_id, :presence => true
  validates :count, :presence => true, :numericality => { :greater_than => 0 }

  scope :ordered, -> { order("created_at desc") }

  private

  def init
    self.price ||= Menu.find(self.menu_id).price if new_record?
  end

  def debit_products
    change_products {|product, ingredient| product.total_count -= ingredient.amount * self.count / product.amount_per_one}
  end

  def restore_products
    change_products {|product, ingredient| product.total_count += ingredient.amount * self.count / product.amount_per_one}
  end

  def change_products &block
    ingredients = Ingredient.find_all_by_menu_id(self.menu_id)
    ingredients.each do |ingredient|
      product = Product.find(ingredient.product_id)
      block.call product, ingredient
      product.save
    end
  end
end

