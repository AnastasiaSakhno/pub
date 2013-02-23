require 'spec_helper'

describe Ingredient do
  it { should validate_presence_of(:product_id) }
  it { should validate_presence_of(:menu_id) }
  it { should validate_presence_of(:measure_id) }
  it { should validate_presence_of(:amount) }
  it { should belong_to(:menu) }
  it { should belong_to(:product) }
end
