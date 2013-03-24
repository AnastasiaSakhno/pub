class Sale < ActiveRecord::Base
  belongs_to :menu
  belongs_to :user, :foreign_key => :seller_id
  before_create :init, :debit_products
  before_destroy :restore_products
  attr_accessible :menu_id, :datetime, :price, :seller_id, :client_name, :count

  validates :menu_id, :presence => true
  validates :seller_id, :presence => true
  validates :count, :presence => true, :numericality => { :greater_than => 0 }

  scope :ordered, -> { order("created_at desc") }

  private

  def init
    self.datetime ||= Time.zone.now if new_record?
    self.price ||= Menu.find(self.menu_id).price if new_record?
  end

  def debit_products
    change_products {|product, ingredient| product.total_count -= product.amount_per_one * ingredient.amount * self.count}
  end

  def restore_products
    change_products {|product, ingredient| product.total_count += product.amount_per_one * ingredient.amount * self.count}
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

