require 'spec_helper'

describe "arrivals/edit" do
  before(:each) do
    load_seeds
    create_and_sign_in_admin
    @arrival = assign(:arrival, FactoryGirl.create(:arrival))
  end

  it "renders the edit arrival form" do
    render

    assert_select "form[action=?][method=?]", arrival_path(@arrival), "post" do
      assert_select "select#arrival_product_id[name=?]", "arrival[product_id]"
      assert_select "input#arrival_incoming_price[name=?]", "arrival[incoming_price]"
      assert_select "input#arrival_sale_price[name=?]", "arrival[sale_price]"
      assert_select "input#arrival_count[name=?]", "arrival[count]"
      assert_select "select#arrival_receiver_id[name=?]", "arrival[receiver_id]"
    end
  end
end
