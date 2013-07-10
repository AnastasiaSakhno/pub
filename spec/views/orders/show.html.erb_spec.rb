require 'spec_helper'

describe "orders/show" do
  before(:each) do
    create_and_sign_in_admin
    @order = create_order
    assign(:order, @order)
    @order.seller_id = FactoryGirl.create(:employee).id
  end

  it "renders attributes in <p>" do
    render
    #rendered.should match(regexp User.find(@order.seller_id).info)
    rendered.should match(regexp @order.client_name)
  end
end
