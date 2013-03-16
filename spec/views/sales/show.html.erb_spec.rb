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
    rendered.should match(Regexp.new Menu.find(@sale.menu_id).name.to_s)
    rendered.should match(Regexp.new @sale.price.to_s)
    rendered.should match(Regexp.new User.find(@sale.seller_id).email.to_s)
    rendered.should match(Regexp.new @sale.client_name.to_s)
  end
end
