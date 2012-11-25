require 'spec_helper'

describe Poster do
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:context) }
  it { should validate_presence_of(:approximate_date) }
end