require 'spec_helper'

describe Arrival do
  it { should validate_presence_of(:product_id) }
  it { should validate_presence_of(:incoming_price) }
  it { should validate_presence_of(:sale_price) }
  it { should validate_presence_of(:receiver_id) }
  it { should validate_presence_of(:count) }
  it { should belong_to(:product) }
  it { should belong_to(:user) }

  describe "before create" do
    it "should change product" do
      load_seeds
      user = FactoryGirl.create(:user)
      product = FactoryGirl.create(:product)
      count = 20
      incoming_price = 10
      sale_price = 30
      arrival = Arrival.new
      arrival.product_id = product.id
      arrival.incoming_price = incoming_price
      arrival.sale_price = sale_price
      arrival.count = count
      arrival.receiver_id = user.id
      arrival.save!
      real_product = Product.find(product.id)
      real_product.total_count.should eq(product.total_count + count)
      real_product.incoming_price.should eq(incoming_price)
      real_product.sale_price.should eq(sale_price)
    end
  end
end
