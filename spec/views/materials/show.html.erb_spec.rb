require 'rails_helper'

RSpec.describe "materials/show", :type => :view do
  before(:each) do
    @material = assign(:material, Material.create!(
      :name => "Name",
      :cast => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
