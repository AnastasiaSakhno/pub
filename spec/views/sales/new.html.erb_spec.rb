require 'spec_helper'

describe "sales/new" do
  before(:each) do
    menu = FactoryGirl.create(:menu)
    assign(:sale, stub_model(Sale,
      :menu_id => 1,
      :price => 1.5
    ).as_new_record)
  end

  it "renders new sale form" do
    render

    assert_select "form", :action => sales_path, :method => "post" do
      assert_select "select#sale_menu_id", :name => "sale[menu_id]"
      assert_select "input#sale_price", :name => "sale[price]"
    end
  end
end
