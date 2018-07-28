require 'spec_helper'

describe "arrivals/fill" do
  before(:each) do
    load_seeds
    create_and_sign_in_admin
    FactoryGirl.create(:product)
    @arrival1 = FactoryGirl.create(:arrival)
    @arrival2 = FactoryGirl.create(:arrival)
    assign(:arrivals, [
      @arrival1,
      @arrival2
    ])
  end

  it "renders a list of arrivals" do
    render
    assert_select "tr>td", :text => Product.find(@arrival1.product_id).name, :count => 2
    assert_select "tr>td", :text => @arrival1.incoming_price, :count => 2
    assert_select "tr>td", :text => @arrival1.sale_price, :count => 2
    assert_select "tr>td", :text => User.find(@arrival1.receiver_id).info, :count => 2
    assert_select "tr>td", :text => @arrival1.count, :count => 2
  end
end
