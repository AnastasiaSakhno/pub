require 'spec_helper'

describe Sale do
  it { should belong_to(:menu) }
  it { should belong_to(:order) }
  it { should validate_presence_of(:menu_id) }
  it { should validate_presence_of(:order_id) }
  it { should validate_presence_of(:count) }

  describe "default" do
    before(:each) do
      @menu = FactoryGirl.create(:menu)
      @sale = FactoryGirl.create(:sale)
      @sale.menu_id = @menu.id
      @sale.save
    end

    describe "price" do
      it "should be menu's price if it does not set" do
        @sale.price.should eq(Menu.find(@sale.menu_id).price)
      end

      it "should stay the same if it set" do
        price = 12.12
        @sale.price = price
        @sale.save
        @sale.price.should eq(price)
      end
    end
  end

  describe "products changing" do
    before(:each) do
      @product1 = create_product Constants::Measure::KILO
      @product2 = create_product Constants::Measure::LITER
      @product3 = create_product Constants::Measure::UNIT
      @menu = FactoryGirl.create(:menu)
      @ingredient1 = create_ingredient @product1, @menu, 10
      @ingredient2 = create_ingredient @product2, @menu, 15
      @ingredient3 = create_ingredient @product3, @menu, 20
      @sale = Sale.new
      @sale.menu_id = @menu.id
      @sale.count = 5
      load_seeds
      @order = create_order
      @sale.order_id = @order.id
      @sale.save!
    end

    it "should debit products after save" do
      check_product_debit @product1, @ingredient1, @sale
      check_product_debit @product2, @ingredient2, @sale
      check_product_debit @product3, @ingredient3, @sale
    end

    it "should restore products after save" do
      product_count1 = Product.find(@product1.id).total_count
      product_count2 = Product.find(@product2.id).total_count
      product_count3 = Product.find(@product3.id).total_count
      @sale.destroy
      check_product_restore @product1, product_count1, @ingredient1, @sale
      check_product_restore @product2, product_count2, @ingredient2, @sale
      check_product_restore @product3, product_count3, @ingredient3, @sale
    end
  end
  
  private

  def check_product_debit product, ingredient, sale
    Product.find(product.id).total_count.should eq(product.total_count - ingredient.amount * sale.count / product.amount_per_one)
  end


  def check_product_restore product, product_count, ingredient, sale
    Product.find(product.id).total_count.should eq(product_count + ingredient.amount * sale.count / product.amount_per_one)
  end

  def create_product measure
    product = FactoryGirl.create(:product)
    product.measure = measure
    product.save
    product
  end
  
  def create_ingredient product, menu, amount
    ingredient = Ingredient.new
    ingredient.product_id = product.id
    ingredient.menu_id = menu.id
    ingredient.amount = amount
    ingredient.save
    ingredient
  end
end
