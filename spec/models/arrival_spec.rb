require 'spec_helper'

describe Arrival do
  it { should validate_presence_of(:product_id) }
  it { should validate_presence_of(:incoming_price) }
  it { should validate_presence_of(:sale_price) }
  it { should validate_presence_of(:receiver_id) }
  it { should validate_presence_of(:count) }
  it { should belong_to(:product) }
  it { should belong_to(:user) }
end
