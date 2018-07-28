require 'spec_helper'

describe "orders/new" do
  before(:each) do
    create_and_sign_in_admin
    assign(:order, stub_model(Order,
      :seller_id => 1,
      :client_name => "MyString"
    ).as_new_record)
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do
      assert_select "select#order_seller_id[name=?]", "order[seller_id]"
      assert_select "input#order_client_name[name=?]", "order[client_name]"
    end
  end
end
