require 'spec_helper'

describe "ingredients/show" do
  before(:each) do
    create_and_sign_in_admin
    @ingredient = assign(:ingredient, stub_model(Ingredient,
      :product_id => 1,
      :menu_id => 2,
      :amount => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/1.5/)
  end
end
