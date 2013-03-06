require 'spec_helper'

describe "ingredients/index" do
  before(:each) do
    assign(:ingredients, [
      stub_model(Ingredient,
        :product_id => 1,
        :menu_id => 2,
        :amount => 1.5
      ),
      stub_model(Ingredient,
        :product_id => 1,
        :menu_id => 2,
        :amount => 1.5
      )
    ])
  end

  it "renders a list of ingredients" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
