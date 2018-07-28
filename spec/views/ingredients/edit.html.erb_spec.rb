require 'spec_helper'

describe "ingredients/edit" do
  before(:each) do
    @ingredient = assign(:ingredient, stub_model(Ingredient,
      :product_id => 1,
      :menu_id => 1,
      :amount => 1.5
    ))
  end

  it "renders the edit ingredient form" do
    render

    assert_select "form", :action => ingredients_path(@ingredient), :method => "post" do
      assert_select "select#ingredient_product_id", :name => "ingredient[product_id]"
      assert_select "select#ingredient_menu_id", :name => "ingredient[menu_id]"
      assert_select "input#ingredient_amount", :name => "ingredient[amount]"
    end
  end
end
