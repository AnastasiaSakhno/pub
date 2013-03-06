require 'spec_helper'

describe Sale do
  it { should validate_presence_of(:menu_id) }

  describe "default" do
    before(:each) do
      @menu = FactoryGirl.create(:menu)
      @sale = FactoryGirl.create(:sale)
      @sale.menu_id = @menu.id
      @sale.save
    end

    describe "date" do
      it "should be today's date if it does not set" do
        @sale.date.should eq(Date.today)
      end

      it "should stay the same if it set" do
        @sale.date = Date.yesterday
        @sale.save
        @sale.date.should eq(Date.yesterday)
      end
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

  it "should debit products after save" do
    product1 = create_product Constants::Measure::KILO
    product2 = create_product Constants::Measure::LITER
    product3 = create_product Constants::Measure::UNIT
    menu = FactoryGirl.create(:menu)
    ingredient1 = create_ingredient product1, menu, 10
    ingredient2 = create_ingredient product2, menu, 15
    ingredient3 = create_ingredient product3, menu, 20
    sale = Sale.new
    sale.menu_id = menu.id
    sale.save
    check_product_change product1, ingredient1
    check_product_change product2, ingredient2
    check_product_change product3, ingredient3
  end
  
  private

  def check_product_change product, ingredient
    Product.find(product.id).total_count.should eq(product.total_count - product.amount_per_one * ingredient.amount)
  end

  def create_product measure
    product = FactoryGirl.create(:product)
    product.measure = measure
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
