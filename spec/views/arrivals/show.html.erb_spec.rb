require 'spec_helper'

describe "arrivals/show" do
  before(:each) do
    load_seeds
    receiver = FactoryGirl.create(:employee)
    product = FactoryGirl.create(:product)
    @arrival = assign(:arrival, FactoryGirl.create(:arrival))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(regexp Product.find(@arrival.product_id).name)
    rendered.should match(regexp @arrival.incoming_price)
    rendered.should match(regexp @arrival.sale_price)
    rendered.should match(regexp @arrival.count)
    user = User.find(@arrival.receiver_id)
    rendered.should match(regexp "#{user.last_name} #{user.name} #{user.middle_name}")
  end
end
