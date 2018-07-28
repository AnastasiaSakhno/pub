require 'spec_helper'

describe "sales/edit" do
  before(:each) do
    create_and_sign_in_admin
    menu = FactoryGirl.create(:menu)
    @sale = assign(:sale, stub_model(Sale,
      :menu_id => menu.id,
      :price => 1.5
    ))
  end

  it "renders the edit sale form" do
    render

    assert_select "form", :action => sales_path(@sale), :method => "post" do
      assert_select "select#sale_menu_id", :name => "sale[menu_id]"
      assert_select "input#sale_price", :name => "sale[price]"
    end
  end
end
