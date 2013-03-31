require 'spec_helper'

describe "sales/show" do
  before(:each) do
    load_seeds
    seller = FactoryGirl.create(:employee)
    menu = FactoryGirl.create(:menu)
    @sale = assign(:sale, FactoryGirl.create(:sale))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(regexp Menu.find(@sale.menu_id).name)
    rendered.should match(regexp @sale.price)
    user = User.find(@sale.seller_id)
    rendered.should match(regexp "#{user.last_name} #{user.name} #{user.middle_name}")
    rendered.should match(regexp @sale.client_name)
  end
end
