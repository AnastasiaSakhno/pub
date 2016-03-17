require 'spec_helper'

describe "arrivals/new" do
  before(:each) do
    load_seeds
    create_and_sign_in_admin
    assign(:arrival, stub_model(Arrival,
      :product_id => 1,
      :incoming_price => 1.5,
      :sale_price => 5.5,
      :receiver_id => 1,
      :count => 1
    ).as_new_record)
  end

  it "renders new arrival form" do
    render

    assert_select "form[action=?][method=?]", arrivals_path, "post" do
      assert_select "select#arrival_product_id[name=?]", "arrival[product_id]"
      assert_select "input#arrival_incoming_price[name=?]", "arrival[incoming_price]"
      assert_select "input#arrival_sale_price[name=?]", "arrival[sale_price]"
      assert_select "input#arrival_count[name=?]", "arrival[count]"
      assert_select "select#arrival_receiver_id[name=?]", "arrival[receiver_id]"
    end
  end
end
