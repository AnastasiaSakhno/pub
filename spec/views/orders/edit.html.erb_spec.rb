require 'spec_helper'

describe "orders/edit" do
  before(:each) do
    create_and_sign_in_admin
    @order = assign(:order, create_order)
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do
      assert_select "select#order_seller_id[name=?]", "order[seller_id]"
      assert_select "input#order_client_name[name=?]", "order[client_name]"
    end
  end
end
