require 'spec_helper'

describe "ingredients/new" do
  before(:each) do
    assign(:ingredient, stub_model(Ingredient,
      :product_id => 1,
      :menu_id => 1,
      :amount => 1.5
    ).as_new_record)
  end

  it "renders new ingredient form" do
    render

    assert_select "form", :action => ingredients_path, :method => "post" do
      assert_select "select#ingredient_product_id", :name => "ingredient[product_id]"
      assert_select "select#ingredient_menu_id", :name => "ingredient[menu_id]"
      assert_select "input#ingredient_amount", :name => "ingredient[amount]"
    end
  end
end
