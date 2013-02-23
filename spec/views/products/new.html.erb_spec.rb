require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :name => "MyString",
      :description => "MyString",
      :incoming_price => 1.5,
      :sale_price => 1.5,
      :total_count => 1.5,
      :amount_per_one => 1.5,
      :measure_id => 1
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path, :method => "post" do
      assert_select "input#product_name", :name => "product[name]"
      assert_select "input#product_description", :name => "product[description]"
      assert_select "input#product_incoming_price", :name => "product[incoming_price]"
      assert_select "input#product_sale_price", :name => "product[sale_price]"
      assert_select "input#product_total_count", :name => "product[total_count]"
      assert_select "input#product_amount_per_one", :name => "product[amount_per_one]"
      assert_select "input#product_measure_id", :name => "product[measure_id]"
    end
  end
end
