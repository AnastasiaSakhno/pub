require 'spec_helper'

describe Product do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:incoming_price) }
  it { should validate_presence_of(:sale_price) }
  it { should validate_presence_of(:total_count) }
  it { should validate_presence_of(:amount_per_one) }
  it { should validate_presence_of(:measure) }
  it { should ensure_inclusion_of(:measure).in_array(Constants::Measure.all) }

  it { should have_many(:menus).through(:ingredients) }
end
