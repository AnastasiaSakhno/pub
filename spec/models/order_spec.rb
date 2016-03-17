require 'spec_helper'

describe Order do
  it { should validate_presence_of(:seller_id) }
  it { should validate_presence_of(:table_number) }
  it { should validate_presence_of(:sales) }

  describe "datetime" do
    before(:each) do
      load_seeds
      @order = create_order
    end

    it "should be today's datetime if it does not set" do
      @order.datetime.to_s.should eq(Time.zone.now.to_s)
    end

    it "should stay the same if it set" do
      datetime = 1.day.ago
      @order.datetime = datetime
      @order.save
      @order.datetime.should eq(datetime)
    end
  end
end
