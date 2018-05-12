require 'rails_helper'

RSpec.describe "materials/fill", :type => :view do
  before(:each) do
    assign(:materials, [
      Material.create!(
        :name => "Name",
        :cast => nil
      ),
      Material.create!(
        :name => "Name",
        :cast => nil
      )
    ])
  end

  it "renders a list of materials" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
