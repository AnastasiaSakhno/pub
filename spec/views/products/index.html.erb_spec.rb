require 'spec_helper'

describe "products/index" do
  before(:each) do
    @product1 = FactoryGirl.create(:product)
    @product2 = FactoryGirl.create(:product)
    assign(:products, [
        @product1,
        @product2
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => @product1.name.to_s, :count => 2
    assert_select "tr>td", :text => @product1.description.to_s, :count => 2
    assert_select "tr>td", :text => @product1.incoming_price.to_s, :count => 2
    assert_select "tr>td", :text => @product1.sale_price.to_s, :count => 2
    assert_select "tr>td", :text => @product1.total_count.to_s, :count => 2
    assert_select "tr>td", :text => @product1.amount_per_one.to_s, :count => 2
    assert_select "tr>td", :text => @product1.measure_id.to_s, :count => 2
  end
end
