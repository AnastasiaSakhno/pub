require 'spec_helper'

describe "ingredients/fill" do
  before(:each) do
    create_and_sign_in_admin
    @menu = FactoryGirl.create(:menu)
    @product = FactoryGirl.create(:product)
    @amount = 1.5
    assign(:ingredients, [
      create_ingredient,
      create_ingredient
    ])
  end

  it "renders a list of ingredients" do
    render
    assert_select "tr>td", :text => @menu.name.to_s, :count => 2
    assert_select "tr>td", :text => @product.name.to_s, :count => 2
    assert_select "tr>td", :text => @amount.to_s, :count => 2
  end

  private

  def create_ingredient
    ingredient = Ingredient.new
    ingredient.menu_id = @menu.id
    ingredient.product_id = @product.id
    ingredient.amount = @amount
    ingredient
  end
end
