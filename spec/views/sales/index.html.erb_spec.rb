require 'spec_helper'

describe "sales/index" do
  before(:each) do
    @menu = FactoryGirl.create(:menu)
    @price = 1.5
    assign(:sales, [
      create_sale(@menu),
      create_sale(@menu)
    ])
  end

  it "renders a list of sales" do
    render
    assert_select "tr>td", :text => @menu.name.to_s, :count => 2
    assert_select "tr>td", :text => @price.to_s, :count => 2
  end

  private

  def create_sale menu
    sale = Sale.new
    sale.menu_id = menu.id
    sale.price = 1.5
    sale.save
    sale
  end
end
