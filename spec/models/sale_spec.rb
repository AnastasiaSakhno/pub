require 'spec_helper'

describe Sale do
  it { should validate_presence_of(:menu_id) }

  describe "default" do
    before(:each) do
      @menu = FactoryGirl.create(:menu)
      @sale = FactoryGirl.create(:sale)
      @sale.menu_id = @menu.id
      @sale.save
    end

    describe "date" do
      it "should be today's date if it does not set" do
        @sale.sale_date.should eq(Date.today)
      end

      it "should stay the same if it set" do
        @sale.sale_date = Date.yesterday
        @sale.save
        @sale.sale_date.should eq(Date.yesterday)
      end
    end

    describe "price" do
      it "should be menu's price if it does not set" do
        @sale.sale_price.should eq(Menu.find(@sale.menu_id).price)
      end

      it "should stay the same if it set" do
        price = 12.12
        @sale.sale_price = price
        @sale.save
        @sale.sale_price.should eq(price)
      end
    end
  end
end
