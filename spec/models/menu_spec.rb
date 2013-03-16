require 'spec_helper'

describe Menu do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:category_id) }

  it { should have_many(:products).through(:ingredients) }
  it { should have_many(:sales) }
end