require 'spec_helper'

describe "orders/fill" do
  before(:each) do
    create_and_sign_in_admin
    @order = create_order
    @order.seller_id = FactoryGirl.create(:employee).id
    assign(:orders, [
        @order,
        create_order
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => User.find(@order.seller_id).info, :count => 2
    assert_select "tr>td", :text => @order.client_name, :count => 2
  end
end
